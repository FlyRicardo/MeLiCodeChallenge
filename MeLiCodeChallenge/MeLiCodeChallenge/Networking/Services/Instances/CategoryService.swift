//
//  CategoryService.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct CategoriesService {
    
    // MARK: Properties
    var urlSession: URLSession
    typealias categoryResponse = (Result<[Categories], NetworkingError>) -> Void
    
    // MARK: Initializers
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

// MARK: CategoryServiceProtocol

extension Categories: CategoryServiceProtocol {
    func getCategories(fromSite: String, handler: @escaping (Result<[Categories], NetworkingError>) -> Void) {

    }
}
