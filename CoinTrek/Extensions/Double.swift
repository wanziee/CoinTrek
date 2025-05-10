//
//  Double.swift
//  CoinTrek
//
//  Created by mohammad ichwan al ghifari on 09/05/25.
//

import Foundation

extension Double {
    
    func formattedCurrencyWithSmallerFraction() -> AttributedString {
            // Format the number as a currency
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.currencyCode = "usd"
            formatter.currencySymbol = "$"
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 6
            
            // Get the full formatted currency string
            guard let formattedString = formatter.string(from: NSNumber(value: self)) else {
                return AttributedString("$0.00")
            }

            // Split the string into whole and fraction parts
            let components = formattedString.split(separator: ".")
            guard components.count == 2 else {
                return AttributedString(formattedString)
            }

            // Create the attributed string with smaller fraction
            var result = AttributedString("\(components[0]).")
            var fractionPart = AttributedString(components[1])
            fractionPart.font = .systemFont(ofSize: 12) // Custom font size for fraction part
            
            result.append(fractionPart)
            return result
        }
    
    func formattedCurrencyWithSmallerFraction2() -> AttributedString {
            // Format the number as a currency
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.currencyCode = "usd"
            formatter.currencySymbol = "$"
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
            
            // Get the full formatted currency string
            guard let formattedString = formatter.string(from: NSNumber(value: self)) else {
                return AttributedString("$0.00")
            }

            // Split the string into whole and fraction parts
            let components = formattedString.split(separator: ".")
            guard components.count == 2 else {
                return AttributedString(formattedString)
            }

            // Create the attributed string with smaller fraction
            var result = AttributedString("\(components[0]).")
            var fractionPart = AttributedString(components[1])
            fractionPart.font = .systemFont(ofSize: 12) // Custom font size for fraction part
            
            result.append(fractionPart)
            return result
        }
    
    
    private var currencyFormatter6: NumberFormatter{
        ///Converts a Double into a Currency with 2-6 decimal places
        ///```
        ///Convert 1234.56 to $1.234.56
        ///Convert 12.3456 to $12.3456
        ///Convert 0.123456 to $0.123456
        ///```
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // default value
        formatter.currencyCode = "usd" // change the currency
        formatter.currencySymbol = "$" // change the currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///Converts a Double into a Currency String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1.234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
        
    }
    
    
    
    
    private var currencyFormatter2: NumberFormatter{
        ///Converts a Double into a Currency with 2-6 decimal places
        ///```
        ///Convert 1234.56 to $1.234.56
        ///Convert 12.3456 to $12.3456
        ///Convert 0.123456 to $0.123456
        ///```
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // default value
//        formatter.currencyCode = "usd" // change the currency
//        formatter.currencySymbol = "$" // change the currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Converts a Double into a Currency String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1.234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith2Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
        
    }
    
    
    
    ///Converts a Double into a String reperesentation
    ///```
    ///Convert 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Converts a Double into a String reperesentation with percent symbol
    ///```
    ///Convert 1.2345 to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

