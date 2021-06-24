//
//  CategoriesPresenterFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

struct HomePresenterFactory {
    var presenter: HomePresenterProtocol
    
    init(observableObject: HomeViewProtocol) {
        let categoryAdapter = CategoryAdapter()
        let productAdapter = ProductAdapter()
        presenter = HomePresenter(categoryAdapter: categoryAdapter,
                                  productAdapter: productAdapter,
                                          view: observableObject)
    }
}
