//
//  CategoriesAdapter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

class CategoryAdapter {
    
    // MARK: - Properties
    let categoryServices = ServicesProvider.create(repository: CategoryServicesProtocol.self)
    typealias CategoriesResponse = Result<[Category], NetworkingError>
    typealias CategoryResponse = Result<Category, NetworkingError>
    
}

// MARK: CategoriesAdapterProtocol

extension CategoryAdapter: CategoryAdapterProtocol {

    func fetchCategories(handler: @escaping (Result<[CategoryModel], NetworkingError>) -> Void) {
        categoryServices.getCategories(fromSite: Constants.Categories.Localizable.site) { (response: CategoriesResponse) in
            switch response {
            case .success(let categories):
                handler(.success(categories.map({ $0.model })))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func fetchCategory(withId id: String,
                       handler: @escaping (Result<CategoryModel, NetworkingError>) -> Void) {
        categoryServices.getCategory(withId: id) { (response: CategoryResponse) in
            switch response {
            case .success(let category):
                handler(.success( category.model ))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }

}
