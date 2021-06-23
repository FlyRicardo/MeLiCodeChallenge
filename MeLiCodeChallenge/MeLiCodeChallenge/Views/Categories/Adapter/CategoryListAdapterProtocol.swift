//
//  CategoriesAdapterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

/// Interface to comunicate to Meli categories endpoints  
protocol CategoryListAdapterProtocol {
    func fetchCategories(handler: @escaping (Result<[CategoryModel], NetworkingError>) -> Void)
    
    func fetchCategory(withId id: String,
                       handler: @escaping (Result<CategoryModel, NetworkingError>) -> Void)
}
