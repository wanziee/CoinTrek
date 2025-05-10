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
//            if showHoldingColumn{
//                centerColumn
//            }
            
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
        HomeView()
            .environmentObject(HomeVM())
    }
}


extension CoinRowView{
    
    private var leftColumn: some View{
        HStack(spacing: 0){
 
                
                
                HStack(){
                    Text("\(coin.rank)")
                        .font(.caption)
                        .foregroundStyle(Color.theme.secondaryText)
                        .frame(minWidth: 20)
                    CoinImageView(coin: coin)
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
                
                

        }
    }
    
//    private var centerColumn: some View{
//        VStack(alignment: .trailing){
//            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
//                .bold()
//                .font(.system(size: 20))
//
//                
//            Text((coin.currentHoldings ?? 0 ).asNumberString())
//        }
//        .foregroundStyle(Color.theme.text)
//    }
    
    private var rightColumn: some View{
        
        //actual price
        VStack(alignment: .trailing){
            Text(showHoldingColumn ? coin.currentHoldingsValue.asCurrencyWith6Decimals() : coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.text)
            Text(showHoldingColumn ? (coin.currentHoldings ?? 0).asNumberString() : coin.priceChangePercentage24H?.asPercentString() ?? "")
                .font(.caption)
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor
                )
        }
        .frame(alignment: .trailing)
//        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

        
    }
    

}
