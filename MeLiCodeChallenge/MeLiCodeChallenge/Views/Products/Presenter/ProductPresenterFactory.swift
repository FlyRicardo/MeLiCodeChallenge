//
//  ProductPresenterFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

struct ProductPresenterFactory {
    var presenter: ProductPresenterProtocol
    
    init(observableObject: ProductListViewProtocol) {
        let productAdapter = ProductAdapter()
        presenter = ProductPresenter(productAdapter: productAdapter,
                                          view: observableObject)
    }
}
