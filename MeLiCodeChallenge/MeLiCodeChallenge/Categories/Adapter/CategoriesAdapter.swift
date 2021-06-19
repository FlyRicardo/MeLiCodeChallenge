//
//  CategoriesAdapter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

struct CategoriesAdapter {
    
    // MARK: - Properties
    let categoryServices = ServicesProvider.create(repository: CategoryServicesProtocol.self)
    typealias CategoriesResponse = Result<[Categories], NetworkingError>
    
}

// MARK: CategoriesAdapterProtocol

extension CategoriesAdapter: CategoriesAdapterProtocol {

    func fetchCategories(handler: @escaping (Result<[Categories], NetworkingError>) -> Void) {
        categoryServices.getCategories(fromSite: "MCO") { (response: CategoriesResponse) in
            switch response {
            case .success(let categories):
                handler(.success(categories))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }

}
