//
//  Float+CurrencyFormmater.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import Foundation

extension Float {
    func currencyFormat() -> String {
        let floatPrice = self as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: floatPrice) ?? ""
    }
    
    func percentageFormat() -> String {
        return String(format: "%.01f", self * 100) + " %"
    }
}
