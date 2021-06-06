//
//  ServiceManagerProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

protocol ServicesManagerProtocol {

    /// Fetches data endpoint asociated to ApiUrlRequestConvertible instatance
    ///
    /// - Parameters:
    ///   - request: enpoint url or a custom URL convertible to URLRequest .`ApiEndpoint` is a case value.
    ///   - handler: callback executed when endpoint response is received. This method is called on the **main thread.**
    ///   - results: Result  that represents either `Entities` conforming Codable protocol (success) or `NetworkingError.case` (error)
    func fetch<T>(_ request: ApiUrlRequestBuilderProtocol,
                  handler: @escaping (Result<[T], NetworkingError>) -> Void) where T: Codable

    
    /// Fetches data endpoint asociated to ApiUrlRequestConvertible instatance
    ///
    /// - Parameters:
    ///   - request: enpoint url or a custom URL convertible to URLRequest .`ApiEndpoint` is a case value.
    ///   - handler: callback executed when endpoint response is received. This method is called on the **main thread.**
    ///   - results: Result  that represents either `Entity` conforming Codable protocol (success) or `NetworkingError.case` (error)
    func fetch<T>(_ request: ApiUrlRequestBuilderProtocol,
                  handler: @escaping (Result<T, NetworkingError>) -> Void) where T: Codable

}

