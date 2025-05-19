//
//  PortfolioView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 18/05/25.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeVM
    @State private var selectedCoin: Coin? = nil
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeVM())
}


extension PortfolioView{
    private var coinLogoList: some View{
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 10){
                ForEach(vm.allCoins){ coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture{
                            withAnimation(.easeIn){
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.blue : Color.clear , lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        }
        .scrollIndicators(.hidden)
    }
}
