//
//  HomeStatsView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 17/05/25.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeVM
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack{
            ForEach(vm.statistics) {stat in
                
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View{
        Group{
            HomeStatsView(showPortfolio: .constant(false))
                .environmentObject(HomeVM())
            
        }
        
    }
}
