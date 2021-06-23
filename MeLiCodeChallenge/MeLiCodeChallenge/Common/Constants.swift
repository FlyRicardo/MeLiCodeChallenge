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
            static let title = "categories.navigationBar.title".localized(inContext: CategoryListPresenter.self)
            static let alertErrorTitle = "categories.alert.error.title".localized(inContext: CategoryListPresenter.self)
            static let alertErrorDescription = "categories.alert.error.description".localized(inContext: CategoryListPresenter.self)
            static let alertErrorButton = "categories.alert.error.button".localized(inContext: CategoryListPresenter.self)
        }
    }
    
    struct Products {
        // Localizable values
        struct Localizable {
            static let title = "navigationBar.title.products".localized(inContext: CategoryListPresenter.self)
        }
    }
}
