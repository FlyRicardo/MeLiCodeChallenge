//
//  ProducListAdapter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

struct ProductListAdapter {
    // MARK: - Properties
    let productServices = ServicesProvider.create(repository: ItemServicesProtocol.self)
    typealias ProductsResponse = Result<[Category], NetworkingError>
    typealias ProductDetailResponse = Result<Category, NetworkingError>
}

extension ProductListAdapter: ProductListAdapterProtocol {
    func fetchProducts(byQuery query: String, handler: @escaping (Result<[ProductModel], NetworkingError>) -> Void) {
        productServices.getItems(fromSite: Constants.Categories.Localizable.site,
                                 byQuery: query) { (response: Result<[Item], NetworkingError>) in
            switch response {
            case .success(let products):
                handler(.success(products.map({ $0.model })))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func fetchProductDetail(withId id: String, handler: @escaping (Result<ProductDetailModel, NetworkingError>) -> Void) {
        productServices.getItemDetail(id: id) { (response: Result<ItemDetail, NetworkingError>) in
            switch response {
            case .success(let item):
                handler(.success(item.model))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
