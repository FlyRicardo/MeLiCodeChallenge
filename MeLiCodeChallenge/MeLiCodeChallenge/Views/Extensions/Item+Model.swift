//
//  Product+Model.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

extension Item {
    var model: ProductModel {
        return ProductModel(id: id,
                            title: title,
                            price: price,
                            thumbnailUrl: URL(string: thumbnail),
                            currency: installments?.currencyId ?? "",
                            installmentQuantity: installments?.quantity ?? 0,
                            installmentAmount: installments?.amount ?? 0.0,
                            shippingCost: "Free")
    }
}
