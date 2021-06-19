//
//  CategoriesAdapterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

/// Interface to comunicate to Meli categories endpoints  
protocol CategoriesAdapterProtocol {
    func fetchCategories(handler: @escaping (Result<[Categories], NetworkingError>) -> Void)
}
