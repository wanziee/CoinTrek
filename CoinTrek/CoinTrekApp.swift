//
//  CoinTrekApp.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 05/05/25.
//

import SwiftUI

@main
struct CoinTrekApp: App {
    
    @StateObject private var vm = HomeVM()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
