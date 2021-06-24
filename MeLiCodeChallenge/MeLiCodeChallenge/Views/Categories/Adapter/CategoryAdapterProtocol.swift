//
//  CategoryListAdapterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

/// Interface to comunicate to Meli categories endpoints
protocol CategoryAdapterProtocol {
    func fetchCategories(handler: @escaping (Result<[CategoryModel], NetworkingError>) -> Void)
    
    func fetchCategory(withId id: String,
                       handler: @escaping (Result<CategoryModel, NetworkingError>) -> Void)
}
