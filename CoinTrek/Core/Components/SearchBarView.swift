//
//  SearchBarView.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 15/05/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.theme.secondaryText)
            

            TextField("Search by name or symbol...", text: $searchText)
                .foregroundStyle(Color.theme.text)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding(.vertical)
                        .padding(.horizontal, 10)
                        .offset(x:11)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .foregroundStyle(Color.theme.text)
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white.opacity(0.09))
                
        )
        .padding()
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeVM())
}
