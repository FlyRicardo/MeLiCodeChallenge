//
//  File.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

struct ProductModel {
    let id: String
    let title: String
    let price: Float
    let thumbnailUrl: URL?
    let currency: String
    let installmentQuantity: Int
    let installmentAmount: Float
    let shippingCost: String
}
