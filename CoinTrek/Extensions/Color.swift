//
//  Color.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 06/05/25.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    let redColor = Color("RedColorTheme")
    let greenColor = Color("GreenColorTheme")
    let text = Color("TextColor")
}
