//
//  ItemServiceProtovol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

protocol ItemServicesProtocol {

    /// Executes request , handle and propagate response, by using callbacks (Result<Success, Failure> type), of items related with a query param from specific country.
    /// - Returns : Items related with a query param in a specific region. (I.e:  , site = MLA retrieves all categories avilable in Argentina)
    /// - Parameters:
    ///     - query: `String`, item key words. e.g., : "q = Motorola%20G6"
    ///     - fromSite: `String`, Country identifier e.g., "MLA"
    ///     - handler: Callback structure called to notify response, either sucess or failure, from service API Items
    func getItems(fromSite site: String, byQuery query: String,
                  handler: @escaping (Result<[Item], NetworkingError>) -> Void)
    
    /// Detail of Item of specific id
    /// - Returns : given Item id
    /// - Parameters:
    ///     - id: `String`, Item Id. Sample, id: "MLA909372335"
    ///     - handler: Callback structure called to notify response, either sucess or failure, from service API Items
    func getItemDetail(id: String,
                       handler: @escaping (Result<ItemDetail, NetworkingError>) -> Void)
    
    /// Executes request , handle and propagate response, by using callbacks (Result<Success, Failure> type), of items related with a category param from specific country.
    /// - Returns : Items related with a category param in a specific region. (I.e:  , site = MLA retrieves items releated to categories avilable in Argentina)
    /// - Parameters:
    ///     - fromSite: `String`, Country identifier e.g., "MLA"
    ///     - categoryId: `String`, item key words. e.g., : "categoryId = MLA5725"
    ///     - handler: Callback structure called to notify response, either sucess or failure, from service API Items
    
    func getItems(fromSite site: String, byCategory categoryId: String,
                  handler: @escaping (Result<[Item], NetworkingError>) -> Void)
    
    
}
