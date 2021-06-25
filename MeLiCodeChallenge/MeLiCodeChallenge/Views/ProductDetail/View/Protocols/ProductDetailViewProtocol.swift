//
//  ProductDetailViewProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

protocol ProductDetailViewProtocol {
    
    func refreshProductDetail(data: ProductDetailModel)
    
    var showErrorObservable: Bool { get set }

    var isLoadingObservable: Bool { get set }

}
