//
//  MeLiSearchItemsViewModel.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 25/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

class MeLiSearchItemsViewModel: NSObject {
    typealias Response = (Bool, String) -> Void
    var searchItems = [ItemsDTO]()
    
    func executeSearchQuery(_ searchText: String, completion: @escaping Response) {
        let networkService = MeLiNetworkService()
        networkService.executeSearchQueryItemsCall(searchText) {[weak self] items, error in
            if let _items = items as? [ItemsDTO] {
                self?.searchItems = _items
                completion(true, error)
            }
            if !error.isEmpty {
                completion(false, "Search error: " + error)
            }
        }
    }
}
