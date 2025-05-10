//
//  CoinRowView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 09/05/25.
//

import SwiftUI
import Foundation

struct CoinRowView: View {
    let coin: Coin
    var showHoldingColumn: Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingColumn{
                centerColumn
            }
            
            rightColumn
        }
        .padding(.horizontal, 0)
        .padding(.vertical, 0)
        .font(.subheadline)
        .listRowBackground(
            Color.white.opacity(0.09)
                .cornerRadius(20)
        )
        
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        //        CoinRowView(coin: dev.coin, showHoldingColumn: true)
        HomeView()
            .environmentObject(HomeVM())
    }
}


extension CoinRowView{
    
    private var leftColumn: some View{
        HStack(spacing: 0){
            ZStack(alignment: .leading){
                
                
                HStack(){
                    Circle()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading){
                        Text(coin.symbol.uppercased())
                            .font(.system(size: 20))
                            .foregroundStyle(Color.theme.text)
                            .bold()
                        
                        Text(coin.name)
                            .foregroundStyle(Color.secondary)
                            .font(.caption)
                    }
                    .padding(.leading, 6)
                }
                
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.background)
                    .overlay(
                        Text("\(coin.rank)")
                            .font(.system(size: 10))
                            .foregroundStyle(Color.theme.text)
                    )
                    .position(x: 10, y: 15)
            }
        }
    }
    
    private var centerColumn: some View{
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.formattedCurrencyWithSmallerFraction2())
                .bold()
                .font(.system(size: 20))

                
            Text((coin.currentHoldings ?? 0 ).asNumberString())
        }
        .foregroundStyle(Color.theme.text)
    }
    
    private var rightColumn: some View{
        
        //actual price
        VStack(alignment: .trailing){
            Text(coin.currentPrice.formattedCurrencyWithSmallerFraction())
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.text)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

        
    }
    

}
