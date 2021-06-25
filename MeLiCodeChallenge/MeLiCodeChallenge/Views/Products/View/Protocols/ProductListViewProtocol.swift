//
//  ProductListObservableObjectProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 21/06/21.
//

import Foundation

protocol ProductListViewProtocol {
    func refreshProductsCards(data: [ProductModel])
    
    var showErrorObservable: Bool { get set }

    var isLoadingObservable: Bool { get set }
}
