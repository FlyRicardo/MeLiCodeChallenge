//
//  Image.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 3/06/21.
//

import Foundation

struct Picture: Codable {
    enum CodingKeys : String, CodingKey {
        case id
        case url
        case secureUrl = "secure_url"
        case size
        case maxSize = "max_size"
    }
    
    let id: String
    let url: String
    let secureUrl: String
    let size: String
    let maxSize: String
}
