//
//  ContentViewModel.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 31/05/21.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    //MARK: - Variables
    typealias CategoriesResponse = Result<[Categories], NetworkingError>
    typealias itemsByQueryResponse = Result<[Item], NetworkingError>
    typealias itemDetail = Result<ItemDetail, NetworkingError>
    let categoryServices = ServicesProvider.create(repository: CategoryServicesProtocol.self)
    let itemServices = ServicesProvider.create(repository: ItemServicesProtocol.self)
    
    //MARK: - Constructor
    
    init() {
        categoryServices.getCategories(fromSite: "MCO") { (response: CategoriesResponse) in
            switch response {
            case .success(let itemDetail):
                print(itemDetail)
            case .failure(let error):
                print(error)
            }
        }
        itemServices.getItems(fromSite: "MCO", byQuery: "Motorola%20G6") { (response: itemsByQueryResponse) in
            switch response {
            case .success(let items):
                print(items)
            case .failure(let error):
                print(error)
            }
        }
        itemServices.getItemDetail(id: "MCO611867191") { (response: itemDetail) in
            switch response {
            case .success(let itemDetail):
                print(itemDetail)
            case .failure(let error):
                print(error)
            }
        }
    }
}
