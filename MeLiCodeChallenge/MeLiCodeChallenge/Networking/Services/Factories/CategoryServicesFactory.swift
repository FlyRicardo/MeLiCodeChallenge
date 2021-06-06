//
//  CategoryServicesFactory.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct CategoriesServiceFactory {
    
    static func create() -> CategoryServiceProtocol {
        let defaultSession = URLSession(configuration: .default)
        
//        let servicesManager = ServicesManager()
        return CategoryService(urlSession: defaultSession) as! CategoryServiceProtocol
    }
}
