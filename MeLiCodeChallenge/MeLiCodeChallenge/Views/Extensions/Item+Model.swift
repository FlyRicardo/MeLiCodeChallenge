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
                            price: price.currencyFormat(),
                            thumbnailUrl: URL(string: thumbnail),
                            currency: installments?.currencyId ?? "",
                            installment: installmentFormatted(installments),
                            shippingCost: productShippingFormatted(shipping?.freeShipping ?? false))
    }
    
    private func installmentFormatted(_ installment: Installments?) -> String {
        guard let installmentAmountFormatted = installments?.amount.currencyFormat(),
              let installmentQuantity = installments?.quantity else {
            return ""
        }
        return installmentAmountFormatted + " x\(installmentQuantity)"
    }

    func productShippingFormatted(_ isFreeShipping: Bool) -> String {
        return isFreeShipping ? Constants.Products.Localizable.shippingFree :
            Constants.Products.Localizable.shippingNotIncluded
    }
}
