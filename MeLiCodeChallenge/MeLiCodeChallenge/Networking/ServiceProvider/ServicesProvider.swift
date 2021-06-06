//
//  ServicesProvider.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

struct ServicesProvider {
    static func create<T>(repository type: T.Type) -> T {
        var service: Any?
        
        switch String(describing: type) {
        case String(describing: CategoryServicesProtocol.self):
            service = CategoriesServiceFactory.create()
        case String(describing: ItemServicesProtocol.self):
            service = ItemServicesFactory.create()
        default:
            fatalError("Cannot create service type: \(String(describing: type.self))")
        }
        
        guard let returnedService = service as? T else {
            fatalError("Cannot create service type: \(String(describing: type.self))")
        }
        
        return returnedService
    }
}
