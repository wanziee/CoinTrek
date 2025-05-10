//
//  HomeVM.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 10/05/25.
//

import Foundation

class HomeVM: ObservableObject{
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
