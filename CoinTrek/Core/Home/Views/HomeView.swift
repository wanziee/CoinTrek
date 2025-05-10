//
//  HomeView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 06/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeVM
    @State private var showPortfolio: Bool = false
    
    
    var body: some View {
        ZStack{
            // Background Layer
            Image("HomeBackground")
                .resizable()
                .ignoresSafeArea()
            
            
            // Content Layer
            VStack{
                homeHeader
                
                HStack{
                    Text("Coins")
                    Spacer()
                    Text("Holdings")
                    Text("Price")
                        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                }
                .font(.caption)
                .padding(.horizontal)
                
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
                
                
                
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
        .environmentObject(dev.homeVM)
        .toolbar(.hidden)
        
    }
    
    
    
}

extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(nil, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.text)
                .animation(nil)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring){
                        showPortfolio.toggle()
                        
                    }
                }
            
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .padding(.horizontal, 10)
    }
    
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .padding(.horizontal, 10)
    }
}
