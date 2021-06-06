//
//  ServiceManager.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation
import os.log

struct ServicesManager: ServicesManagerProtocol {
    
    let session: URLSession
    private let successRange = 200...299
    
    /**
     creates an instance of ServicesManagerProtocol with a session passed with parameter
    
     - parameters:
        - session: The URLSession to do the requests
    */
    init(session: URLSession) {
        self.session = session
    }
    
    func fetch<T>(_ request: ApiUrlRequestBuilderProtocol,
                  handler: @escaping (Result<[T], NetworkingError>) -> Void) where T : Codable {
        
        guard let urlRequest = try? request.asURLRequest() else {
            handler(.failure(.requestFailed))
            return
        }
        
        // TODO: Create a separate object to this execution
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                if let error = error as NSError?, error.code == NSURLErrorCancelled {
                    handler(.failure(.cancelled))
                    return
                }
                handler(.failure(.requestFailed))
                return
            }

            guard let httpUrlResponse = response as? HTTPURLResponse else {
                handler(.failure(.requestFailed))
                return
            }

            guard self.successRange.contains(httpUrlResponse.statusCode) else {
                handler(.failure(.responseError(data: data, httpUrlResponse: httpUrlResponse)))
                return
            }
                        
            guard let response = ApiResponse<T>(data: data, httpUrlResponse: httpUrlResponse) else {
                handler(.failure(.apiParseError))
                return
            }
            
            handler(.success(response.entities))
        }

        dataTask.resume()
    }
    
    func fetch<T>(_ request: ApiUrlRequestBuilderProtocol, handler: @escaping (Result<T, NetworkingError>) -> Void) where T : Decodable, T : Encodable {
        guard let urlRequest = try? request.asURLRequest() else {
            handler(.failure(.requestFailed))
            return
        }
        
        // TODO: Create a separate object to this execution
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                if let error = error as NSError?, error.code == NSURLErrorCancelled {
                    handler(.failure(.cancelled))
                    return
                }
                handler(.failure(.requestFailed))
                return
            }

            guard let httpUrlResponse = response as? HTTPURLResponse else {
                handler(.failure(.requestFailed))
                return
            }

            guard self.successRange.contains(httpUrlResponse.statusCode) else {
                handler(.failure(.responseError(data: data, httpUrlResponse: httpUrlResponse)))
                return
            }
                        
            guard let response = ApiResponse<T>(data: data, httpUrlResponse: httpUrlResponse),
                  let entity = response.entities.first else {
                handler(.failure(.apiParseError))
                return
            }
            
            handler(.success(entity))
        }

        dataTask.resume()
    }
}
