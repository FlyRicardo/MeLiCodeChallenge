//
//  CategoryServiceProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 29/05/21.
//

import Foundation


protocol CategoryServicesProtocol {
    
    /// Executes request , handle and propagate response, by using callbacks, of category items from specific country.
    /// - Returns : Categories from given site. (I.e: site = MLA retrieves categories avilable in Argentina)
    /// - Parameters:
    ///     - fromSite: `String`, Country identifier
    ///     - handler: Callback structure called to notify response, either sucess or failure, of service API Categories
    func getCategories(fromSite site: String,
                       handler: @escaping (Result<[Categories], NetworkingError>) -> Void)
}
