//
//  ItemsServiceFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 6/06/21.
//

import Foundation

struct ItemServicesFactory {
    
    static func create() -> ItemServicesProtocol {
        let defaultSession = URLSession(configuration: .default)
        let defaultServicesManager = ServicesManager(session: defaultSession)
    
        return ItemServices(servicesManager: defaultServicesManager)
    }
}
