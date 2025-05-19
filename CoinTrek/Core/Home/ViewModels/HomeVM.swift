//
//  HomeVM.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 10/05/25.
//

import Foundation
import Combine

class HomeVM: ObservableObject{
    
    @Published var statistics: [Statistic] = []
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){

        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
        marketDataService.$marketData
            .map{(MarketData) -> [Statistic] in
                
                var stats: [Statistic] = []
                
                guard let data = MarketData else { return stats }
                
                let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24hUsd)
                let volume = Statistic(title: "24h Volume", value: data.volume)
                let btcDominance = Statistic(title: "BTC Dominance", value:data.btcDominance)
                let portfolio = Statistic(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
                
                stats.append(contentsOf: [
                    marketCap,
                    volume,
                    btcDominance,
                    portfolio
                ])
                
                return stats
            }
            .sink{[weak self] (returnedStats) in
                self?.statistics = returnedStats
                
            }
            .store(in: &cancellables)
        
    }
    
    private func filteredCoins(text: String, coins: [Coin]) -> [Coin]{
        guard !text.isEmpty else{
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
