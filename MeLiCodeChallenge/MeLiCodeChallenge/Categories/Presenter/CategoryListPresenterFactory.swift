//
//  CategoriesPresenterFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

struct CategoryListPresenterFactory {
    var presenter: CategoryListPresenterProtocol
    
    init(observableObject: CategoryListObservableObjectProtocol) {
        let adapter = CategoryListAdapter()
        presenter = CategoryListPresenter(adapter: adapter,
                                        observableObject: observableObject)
    }
}
