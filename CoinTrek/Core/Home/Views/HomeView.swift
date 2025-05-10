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
            VStack(){
                homeHeader
                
        
                
                if !showPortfolio{
                    HStack(spacing: 3){
                        Text("All")
                            .fontWeight(.semibold)
                        
                        Text("Coins")
                        
                        Spacer()
                    }
                    .font(.system(size: 17))
                    .padding(.horizontal)
                    
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    HStack(spacing: 3){
                        Text("Your")
                            .fontWeight(.semibold)
                        
                        Text("Assets")
                        
                        Spacer()
                    }
                    .font(.system(size: 17))
                    .padding(.horizontal)
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
        .environmentObject(HomeVM())
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
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .padding(.horizontal, 10)
        .listRowSpacing(7)
    }
    
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .padding(.horizontal, 10)
        .listRowSpacing(7)
    }
}
