//
//  CoinImageService.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 11/05/25.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    
    init(coin: Coin){
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage(){
        guard let url = URL(string: coin.image) else {return}
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
