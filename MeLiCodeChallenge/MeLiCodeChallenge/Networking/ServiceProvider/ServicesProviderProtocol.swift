//
//  ServicesProviderProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

protocol ServicesProviderProtocol {
    
    /// Creates a concrete class instance of a entity services protocol
    /// - Parameter type: The type of the instance to be created. e.g. `CategoriesService.self`.
    /// - Returns: A concrete type of the protocol.
    /// - Warning: `type` must be of a service protocol only.
    static func create<T>(repository type: T.Type) -> T
}
