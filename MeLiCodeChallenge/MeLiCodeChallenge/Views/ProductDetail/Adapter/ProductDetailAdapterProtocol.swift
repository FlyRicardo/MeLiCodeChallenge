//
//  ProductDetailAdapterProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

/// Interface to comunicate to Meli categories endpoints
protocol ProductDetailAdapterProtocol {
    func fetchProductsDetail(byProductId productId: String,
                             handler: @escaping (Result<ProductDetailModel, NetworkingError>) -> Void)
}
