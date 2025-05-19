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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}

