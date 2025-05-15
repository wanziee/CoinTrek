//
//  UIApplication.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 15/05/25.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
