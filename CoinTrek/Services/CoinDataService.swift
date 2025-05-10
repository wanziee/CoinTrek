//
//  CoinDataService.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 10/05/25.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [Coin] = []
    
    var coinSubscribtion: AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24hr") else {return}
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        coinSubscribtion = NetworkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: decoder)
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscribtion?.cancel()
            })
        
    }
    
    
    
    
    
}
