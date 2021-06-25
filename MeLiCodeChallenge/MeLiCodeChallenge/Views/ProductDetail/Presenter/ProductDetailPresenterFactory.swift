//
//  ProductDetailPresenterFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

struct ProductDetailPresenterFactory {
    var presenter: ProductDetailPresenterProtocol
    
    init(observableObject: ProductDetailViewProtocol) {
        let productDetailAdapter = ProductDetailAdapter()
        presenter = ProductDetailPresenter(productDetailAdapter: productDetailAdapter,
                                          view: observableObject)
    }
}
