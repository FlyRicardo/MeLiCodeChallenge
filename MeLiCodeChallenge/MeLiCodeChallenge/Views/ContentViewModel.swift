//
//  ContentViewModel.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 31/05/21.
//

import Foundation
import SwiftUI
import Kingfisher

class ContentViewModel: ObservableObject {
    
    //MARK: - Variables
    typealias CategoriesResponse = Result<[Categories], NetworkingError>
    typealias itemsByQueryResponse = Result<[Item], NetworkingError>
    typealias itemDetail = Result<ItemDetail, NetworkingError>
    let categoryServices = ServicesProvider.create(repository: CategoryServicesProtocol.self)
    let itemServices = ServicesProvider.create(repository: ItemServicesProtocol.self)
    
    //MARK: Publised Variables
    @Published var url: URL!
    
    //MARK: - Constructor
    
    init() {
        self.url = URL(string: "")
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
        itemServices.getItemDetail(id: "MLA909254100") { (response: itemDetail) in
            switch response {
            case .success(let itemDetail):
                DispatchQueue.main.async {
                    guard let picture = itemDetail.pictures.first, let url = URL(string: picture.url) else { return }
                    self.url = url
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
