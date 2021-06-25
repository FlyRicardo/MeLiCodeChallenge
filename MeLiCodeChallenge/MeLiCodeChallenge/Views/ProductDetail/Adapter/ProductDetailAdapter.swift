//
//  ProductDetailAdapter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

class ProductDetailAdapter {
    // MARK: - Properties
    let productServices = ServicesProvider.create(repository: ItemServicesProtocol.self)
    typealias ProductsResponse = Result<ItemDetail, NetworkingError>
}

extension ProductDetailAdapter: ProductDetailAdapterProtocol {
    func fetchProductsDetail(byProductId productId: String, handler: @escaping (Result<ProductDetailModel, NetworkingError>) -> Void) {
        productServices.getItemDetail(id: productId) { (response: Result<ItemDetail, NetworkingError>) in
            switch response {
            case .success(let productDetail):
                DispatchQueue.main.async {
                    handler(.success(productDetail.model))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
}

          
    
