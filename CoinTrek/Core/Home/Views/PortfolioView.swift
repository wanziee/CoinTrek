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
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                portfolioInputSection
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButton
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
            .frame(height: 130)
            .padding(.leading)
        }
        .scrollIndicators(.hidden)
    }
    
    private func getCurrentValue() -> Double{
        if let quantity = Double(quantityText){
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View{
        VStack(alignment: .leading, spacing: 0){
            SearchBarView(searchText: $vm.searchText)
            coinLogoList
            
            
            if selectedCoin != nil{
                VStack(spacing: 20){
                    HStack{
                        Text("Curren Price of \(selectedCoin?.symbol.uppercased() ?? ""):")

                        Spacer()
                        Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")

                    }
                    Divider()
                    HStack{
                        Text("Amount in your portfolio: ")
                        Spacer()
                        TextField("Ex: 1.4", text: $quantityText)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                    Divider()
                    HStack{
                        Text("Curren value:")
                        Spacer()
                        Text(getCurrentValue().asCurrencyWith2Decimals())

                    }
                }
                .animation(nil, value: selectedCoin?.id)
                .padding()
                .font(.headline)
                
            }
        }
    }
    
    private var trailingNavBarButton: some View{
        HStack(spacing: 10){
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)

            Button {
                saveButtonPressed()
            } label: {
                Text("SAVE")
                    .foregroundStyle(Color.theme.text)
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 :0.0
            )

        }
        .font(.headline)
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin else { return }
        
        //save to portfolio
        
        
        // show checkmark
        withAnimation(.easeIn){
            showCheckmark = true
            removeSelectedCoin()
        }
        
        //hide keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut){
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin(){
        selectedCoin = nil
        vm.searchText = ""
    }
}
