//
//  StatisticsView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 17/05/25.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: Statistics
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct Statistic_Previews: PreviewProvider {
    static var previews: some View{
        Group{
            StatisticView(stat: dev.state1)
            StatisticView(stat: dev.state2)
            StatisticView(stat: dev.state3)
            
        }
        
    }
}
