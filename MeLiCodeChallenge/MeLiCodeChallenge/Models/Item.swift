//
//  Item.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

public struct Item: Codable {
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case price
        case installments
        case shipping
        case thumbnail
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
    }

    let id: String
    let title: String
    let price: Float
    let installments: Installments
    let shipping: Shipping
    let thumbnail: String
    let currencyId: String?
    let availableQuantity: Int?
}
