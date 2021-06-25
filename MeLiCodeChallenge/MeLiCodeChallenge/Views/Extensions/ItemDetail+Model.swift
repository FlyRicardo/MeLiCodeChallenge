//
//  File.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

extension ItemDetail {
    var model: ProductDetailModel {
        return ProductDetailModel(id: id,
                                  title: title,
                                  price: price.currencyFormat(),
                                  currency: currency,
                                  pictures: pictures.map({ $0.model }),
                                  warranty: warranty,
                                  shippingMode: shipping.freeShipping ? "Free shipping" : "")
    }
    
    func productShippingFormatted(_ isFreeShipping: Bool) -> String {
        return isFreeShipping ? Constants.Products.Localizable.shippingFree :
            Constants.Products.Localizable.shippingNotIncluded
    }
}
