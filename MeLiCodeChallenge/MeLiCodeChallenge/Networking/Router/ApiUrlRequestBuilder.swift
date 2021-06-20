//
//  ApiUrlRequestBuilder.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

enum ApiUrlRequestBuilder {
    case categories(site: String)
    case category(id: String)
    case items(bySite: String, query: String)
    case itemDetail(id: String)
    
    var urlString: String {
        let serverUrl = domain()
        
        switch self {
        case .categories(let site):
            return "\(serverUrl)/sites/\(site)/categories"

        case .category(let id):
            return "\(serverUrl)/categories/\(id)"
            
        case .items(let bySite, let query):
            return "\(serverUrl)/sites/\(bySite)/search?q=\(query)"
            
        case .itemDetail(let id):
            return "\(serverUrl)/items/\(id)"
        }
    }
    
    func domain() -> String {
        return "https://api.mercadolibre.com"
    }
}

// MARK: ApiUrlRequestBuilderProtocol

extension ApiUrlRequestBuilder: ApiUrlRequestBuilderProtocol {
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: urlString) else { throw NetworkingError.urlRequestBuildFailed }
        
        return URLRequest(url: url)
    }
}
