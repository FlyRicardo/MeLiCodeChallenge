//
//  CategoriesPresenterFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

struct CategoriesPresenterFactory {
    var presenter: CategoriesPresenterProtocol
    
    init(observableObject: CategoriesObservableObjectProtocol) {
        let adapter = CategoriesAdapter()
        presenter = CategoriesPresenter(adapter: adapter,
                                        observableObject: observableObject)
    }
}
