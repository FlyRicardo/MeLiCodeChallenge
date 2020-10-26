//
//  MeLiNetworkService.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 17/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import Foundation

class MeLiNetworkService: NSObject {
    //
    // MARK: - Constants
    //
    private let defaultSession = URLSession(configuration: .default)
    
    //
    // MARK: - Type Alias
    //
    typealias Response = ([Any]?, String) -> Void
    
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    
    func executeSearchQueryItemsCall(_ searchTerm: String, completion: @escaping Response) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://api.mercadolibre.com/sites/MLA/search") {
            urlComponents.query = "q=\(searchTerm)"
            
            guard let url = urlComponents.url else {
                return
            }
            
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                
                if let error = error {
                    self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if
                    let safeData = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    //Parse MeLi responses
                    let parsedItems = MeLiParserItem.parseItems(safeData)
                    
                    DispatchQueue.main.async {
                      completion(parsedItems, self?.errorMessage ?? "")
                    }
                }
            }
            
            dataTask?.resume()
        }
    }
                                                   
//    internal static func itineraryCacheDelegate(requestBuilder: WDPRItineraryRequestBuilder) -> WDPRItineraryCacheDelegate?
}
