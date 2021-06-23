//
//  CategoryResponse.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 2/06/21.
//

import Foundation

struct CategoryResponse: Codable {
    enum CodingKeys : String, CodingKey {
        case siteId = "site_id"
        case items = "results"
    }
    let siteId: String
    let items: [Item]
}
