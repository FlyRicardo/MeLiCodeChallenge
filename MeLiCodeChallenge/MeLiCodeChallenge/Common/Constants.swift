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
            static let categoriesTitle = "navigationBar.title.categories".localized(inContext: CategoryListPresenter.self)
        }
    }
    
    struct Products {
        // Localizable values
        struct Localizable {
            static let categoriesTitle = "navigationBar.title.products".localized(inContext: CategoryListPresenter.self)
        }
    }
}
