//
//  HomeVM.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 10/05/25.
//

import Foundation
import Combine

class HomeVM: ObservableObject{
    
    @Published var statistics: [Statistics] = [
        Statistics(title: "title", value: "value", percentageChange: 1),
        Statistics(title: "title", value: "value"),
        Statistics(title: "title", value: "value"),
        Statistics(title: "title", value: "value", percentageChange: -7),
    ]
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubsribers()
    }
    
    func addSubsribers(){

        // updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
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
