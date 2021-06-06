//
//  ItemService.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

struct ItemServices {
    // MARK: Properties
    let servicesManager: ServicesManagerProtocol
    typealias ItemsResponse = Result<[Item], NetworkingError>
    
    // MARK: Initializers
    init(servicesManager: ServicesManagerProtocol) {
        self.servicesManager = servicesManager
    }
}

// MARK: CategoryServiceProtocol

extension ItemServices: ItemServicesProtocol {
    func getItems(fromSite site: String, byQuery query: String,
                  handler: @escaping (Result<[Item], NetworkingError>)-> Void) {
        servicesManager.fetch(ApiUrlRequestBuilder.items(bySite: site, query: query)) { (result: Result<Items, NetworkingError>) in
            switch result {
            case .success(let items):
                handler(.success(items.results))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }

    func getItemDetail(id: String,
                       handler: @escaping (Result<ItemDetail, NetworkingError>) -> Void) {
        servicesManager.fetch(ApiUrlRequestBuilder.itemDetail(id: id)) { (result: Result<ItemDetail, NetworkingError>) in
            switch result {
            case .success(let itemDetail):
                handler(.success(itemDetail))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
