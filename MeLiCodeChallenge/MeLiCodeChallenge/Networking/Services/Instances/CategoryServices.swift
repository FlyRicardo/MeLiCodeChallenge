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
    typealias CategoriesResponse = Result<[Categories], NetworkingError>
    
    // MARK: Initializers
    init(servicesManager: ServicesManagerProtocol) {
        self.servicesManager = servicesManager
    }
}

// MARK: CategoryServiceProtocol

extension CategoryServices: CategoryServicesProtocol {
    func getCategories(fromSite site: String,
                       handler: @escaping (CategoriesResponse) -> Void) {
        servicesManager.fetch(ApiUrlRequestBuilder.categories(site: site)) { (result: Result<[Categories], NetworkingError>) in
            switch result {
            case .success(let itemDetail):
                handler(.success(itemDetail))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
