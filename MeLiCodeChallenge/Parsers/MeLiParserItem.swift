//
//  MeLiParserItem.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 17/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import Foundation

class MeLiParserItem: NSObject {
    public static func parseItems(_ itemsData: Data) -> [Any] {
//        do {
//            response = try JSONSerialization.jsonObject(with: itemsData, options: []) as! [AnyHashable : Any]
//        } catch let parseError as NSError {
//          errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
//          return [Any]()
//        }
//
//        guard let results = response[DictionaryKey.results] as? [[AnyHashable : Any]] else {
//            return [Any]()
//        }
//        print("Results count: \(results.count)")
        
        // Array of processed itinerary item dictionaries. This will be returned, to be used by
        // the app.

//        results.map{
//            if let result  = $0 as? [AnyHashable : Any],
//                let seller = result[DictionaryKey.seller] {
//                print("Seller: \(seller)")
//            }
//        }
        
        var response : ResponseDTO
        var errorMessage = String()
        let decoder = JSONDecoder()
        do {
            response = try decoder.decode(ResponseDTO.self, from: itemsData)
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            print(errorMessage)
            return [Any]()
        }
        return response.items
    }
}

internal extension MeLiParserItem {
    struct DictionaryKey {
        static let results = "results"
        static let seller = "seller"
    }
}
