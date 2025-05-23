//
//  Statistics.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 17/05/25.
//

import Foundation


struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}


