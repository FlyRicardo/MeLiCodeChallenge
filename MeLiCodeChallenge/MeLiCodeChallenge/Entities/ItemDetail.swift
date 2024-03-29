//
//  ItemDetails.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 3/06/21.
//

import Foundation

struct ItemDetail: Codable {
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case price
        case currency = "currency_id"
        case pictures = "pictures"
        case shipping
        case warranty
    }
    
    let id: String
    let title: String
    let price: Float
    let currency: String
    let pictures: [Picture]
    let shipping: Shipping
    let warranty: String
}
