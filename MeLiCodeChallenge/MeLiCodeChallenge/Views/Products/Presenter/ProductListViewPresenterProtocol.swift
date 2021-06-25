//
//  ProductListPresenterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

/// Interface exposing actions that transform the product view actions into a product model action,
/// as well as transforms the product models data into presentation values
protocol ProductViewPresenterProtocol {
    func loadProducts(bycategory category: String)
}
