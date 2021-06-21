//
//  CategoriesAdapter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

struct CategoryListAdapter {
    
    // MARK: - Properties
    let categoryServices = ServicesProvider.create(repository: CategoryServicesProtocol.self)
    typealias CategoriesResponse = Result<[Category], NetworkingError>
    typealias CategoryResponse = Result<Category, NetworkingError>
    
}

// MARK: CategoriesAdapterProtocol

extension CategoryListAdapter: CategoryListAdapterProtocol {

    func fetchCategories(handler: @escaping (Result<[Category], NetworkingError>) -> Void) {
        categoryServices.getCategories(fromSite: "MCO") { (response: CategoriesResponse) in
            switch response {
            case .success(let categories):
                handler(.success(categories))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func fetchCategory(withId id: String,
                       handler: @escaping (Result<Category, NetworkingError>) -> Void) {
        categoryServices.getCategory(withId: id) { (response: CategoryResponse) in
            switch response {
            case .success(let category):
                handler(.success(category))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }

}
