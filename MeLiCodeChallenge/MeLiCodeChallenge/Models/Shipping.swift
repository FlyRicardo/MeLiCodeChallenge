//
//  Shipping.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

struct Shipping: Codable {
    enum CodingKeys : String, CodingKey {
        case freeShipping = "free_shipping"
    }
    
    let freeShipping: Bool
}
