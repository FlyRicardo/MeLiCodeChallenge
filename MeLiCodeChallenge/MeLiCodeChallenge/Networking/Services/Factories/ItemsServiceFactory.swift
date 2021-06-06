//
//  ItemsServiceFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 6/06/21.
//

import Foundation

struct ItemServiceFactory {
    
    static func create() -> ItemsServiceProtocol {
        let defaultSession = URLSession(configuration: .default)
        let defaultServicesManager = ServicesManager(session: defaultSession)
    
        return ItemsService(servicesManager: defaultServicesManager)
    }
}
