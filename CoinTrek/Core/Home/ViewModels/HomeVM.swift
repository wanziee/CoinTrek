//
//  HomeVM.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 10/05/25.
//

import Foundation
import Combine

class HomeVM: ObservableObject{
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubsribers()
    }
    
    func addSubsribers(){
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)

    }
}
