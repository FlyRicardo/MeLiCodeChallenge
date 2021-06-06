//
//  ApiUrlRequestConvertible.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 30/05/21.
//

import Foundation

protocol ApiUrlRequestBuilderProtocol {
    
    /// Returns URLRequest for each endpoint implemented
    func asURLRequest() throws -> URLRequest
}
