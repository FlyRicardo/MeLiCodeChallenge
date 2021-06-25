//
//  Constants.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import Foundation

struct Constants{
    struct Error {
        static let urlError = "URL error"
        static let parsingError = "Parsing"
        static let serviceRequest = "Service Request"
        static let serviceResponse = "Service Response"
    }
    
    struct Categories {
        // Localizable value
        struct Localizable {
            static let site = "categories.site".localized(inContext: CategoryAdapter.self)
            static let title = "categories.navigationBar.title".localized(inContext: HomePresenter.self)
            static let alertErrorTitle = "categories.alert.error.title".localized(inContext: HomePresenter.self)
            static let alertErrorDescription = "categories.alert.error.description".localized(inContext: HomePresenter.self)
            static let alertErrorButton = "categories.alert.error.button".localized(inContext: HomePresenter.self)
        }
    }
    
    struct Products {
        // Localizable values
        struct Localizable {
            static let titleList = "navigationBar.title.products".localized(inContext: HomePresenter.self)
            static let titleDetail = "navigationBar.title.product.detail".localized(inContext: HomePresenter.self)
            static let shippingFree = "product.shipping.free".localized(inContext: HomePresenter.self)
            static let shippingNotIncluded = "product.shipping.notincluded".localized(inContext: HomePresenter.self)
        }
    }
}
