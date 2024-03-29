//
//  ProductDetailModel.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

struct ProductDetailModel {
    let id: String
    let title: String
    let price: String
    let currency: String
    let pictures: [PictureModel]
    let warranty: String
    let shippingMode: String
}

