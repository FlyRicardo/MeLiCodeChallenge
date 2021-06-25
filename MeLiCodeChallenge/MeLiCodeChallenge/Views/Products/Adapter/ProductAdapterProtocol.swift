//
//  ProductListAdapterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

/// Interface to comunicate to Meli categories endpoints
protocol ProductAdapterProtocol {
    func fetchProducts(byQuery query: String,
                       handler: @escaping (Result<[ProductModel], NetworkingError>) -> Void)
    
    func fetchProductDetail(withId id: String,
                            handler: @escaping (Result<ProductDetailModel, NetworkingError>) -> Void)
    
    func fetchProducts(byCategory categoryId: String,
                       handler: @escaping (Result<[ProductModel], NetworkingError>) -> Void)
}
