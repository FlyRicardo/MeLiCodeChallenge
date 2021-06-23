//
//  Items.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 6/06/21.
//

import Foundation

struct Items: Codable {
    enum CodingKeys : String, CodingKey {
        case siteId = "site_id"
        case results
    }
    
    let results: [Item]
    let siteId: String
}
