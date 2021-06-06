//
//  CategoryServicesFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct CategoriesServiceFactory {

    static func create() -> CategoryServicesProtocol {
        let defaultSession = URLSession(configuration: .default)
        let defaultServicesManager = ServicesManager(session: defaultSession)
        
        return CategoryServices(servicesManager: defaultServicesManager)
    }
}
