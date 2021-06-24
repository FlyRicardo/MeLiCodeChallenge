//
//  Float+Formmaters.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

extension Float {
    func currencyFormat() -> String {
        let floatPrice = self as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.generatesDecimalNumbers = false
        formatter.alwaysShowsDecimalSeparator = false
        formatter.currencySymbol = "$"
        return formatter.string(from: floatPrice) ?? "$ 0"
    }
    
    func percentageFormat() -> String {
        return String(format: "%.01f", self * 100) + " %"
    }
}

