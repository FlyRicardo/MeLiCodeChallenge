//
//  ProductDetailModel.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

struct ProductDetailModel {
    let id: String
    let title: String
    let price: Int
    let currency: String
    let pictures: [PictureModel]
    let warranty: String
    let shippingMode: String
}
