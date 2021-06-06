//
//  ServiceManager.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct ServicesManager: ServicesMangerProtocol {
    
    func fetch<T>(_ request: ApiUrlRequestBuilderProtocol,
                  handler: @escaping (Result<[T], NetworkingError>) -> Void) where T : Decodable, T : Encodable {
        
    }
}
