//
//  ContentView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                Text("textColor")
                    .foregroundStyle(Color.theme.text)
                
                Text("positive")
                    .foregroundStyle(Color.theme.greenColor)
                
                Text("Negative")
                    .foregroundStyle(Color.theme.redColor)
                
                Text("accentColor")
                    .foregroundStyle(Color.theme.accent)
            }
        }
    }
}

#Preview {
    ContentView()
}
