//
//  NetworkingError.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 29/05/21.
//

import Foundation

// List all possible errors which may happen in fetch data from API process
enum NetworkingError: Error {
    case cancelled
    case errorParsing(errorDescription: String)
    case requestFailed
    case apiParseError
    case responseError(data: Data? = nil, httpUrlResponse: HTTPURLResponse? = nil)
    case urlRequestBuildFailed
}
