//
//  CoinImageView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 11/05/25.
//

import SwiftUI



struct CoinImageView: View {
    @StateObject var vm: CoinImageVM
    
    init(coin: Coin){
        _vm = StateObject(wrappedValue: CoinImageVM(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading{
                ProgressView()
            } else{
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

