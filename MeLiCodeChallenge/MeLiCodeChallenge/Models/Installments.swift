//
//  Installments.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

struct Installments: Codable {
    enum CodingKeys : String, CodingKey {
        case currencyId = "currency_id"
        case quantity
        case amount
        case rate
    }

    let quantity: Int
    let amount: Float
    let rate: Float
    let currencyId: String
}
