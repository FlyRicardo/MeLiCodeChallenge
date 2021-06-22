//
//  CategoriesObservableObjectProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import Foundation

// Functions that notifies changes to `Published` parameters within Observable Objects
protocol CategoryListObservableObjectProtocol {
    
    func refreshCards(data: [Category])
    
    func showError()

    func hideLoading()

    func showLoading()

}
