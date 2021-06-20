//
//  CategoryService.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct CategoryServices {
    
    // MARK: Properties
    let servicesManager: ServicesManagerProtocol
    typealias CategoriesResponse = Result<[Category], NetworkingError>
    typealias CategoryResponse = Result<Category, NetworkingError>
    
    // MARK: Initializers
    init(servicesManager: ServicesManagerProtocol) {
        self.servicesManager = servicesManager
    }
}

// MARK: CategoryServiceProtocol

extension CategoryServices: CategoryServicesProtocol {
    func getCategories(fromSite site: String,
                       handler: @escaping (CategoriesResponse) -> Void) {
        servicesManager.fetch(ApiUrlRequestBuilder.categories(site: site)) { (result: Result<[Category], NetworkingError>) in
            switch result {
            case .success(let categories):
                handler(.success(categories))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func getCategory(withId id: String,
                       handler: @escaping (CategoryResponse) -> Void) {
        servicesManager.fetch(ApiUrlRequestBuilder.category(id: id)) { (result: Result<Category, NetworkingError>) in
            switch result {
            case .success(let category):
                handler(.success(category))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
