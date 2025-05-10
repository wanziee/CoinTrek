//
//  CircleButtonView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 09/05/25.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.text)
            .frame(width: 60, height: 60)
            .background(
                Circle()
                    .fill(Color.white.opacity(0.05))
            )
            .padding()
            
    }
}

#Preview(){
    HomeView()
}
