//
//  File.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

/// Interface exposing actions that transform the categories view actions into a categories model action,
/// as well as transforms the categories models data into presentation values
protocol HomePresenterProtocol {
    func loadCategories()
    func loadProducts(byText text: String)
}
