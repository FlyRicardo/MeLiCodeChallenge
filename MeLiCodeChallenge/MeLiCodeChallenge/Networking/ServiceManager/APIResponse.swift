//
//  APIResponse.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 5/06/21.
//

import Foundation
import os.log

struct ApiResponse<T: Codable> {

    let entities: [T]
    let httpUrlResponse: HTTPURLResponse

    init(entities: [T], httpUrlResponse: HTTPURLResponse) {
        self.entities = entities
        self.httpUrlResponse = httpUrlResponse
    }

    init?(data: Data?, httpUrlResponse: HTTPURLResponse) {
        let decoder = JSONDecoder()
        guard let data = data else {
            return nil
        }
        do {
            self.entities = try decoder.decode([T].self, from: data).compactMap { $0 }
        } catch {
            Logger(subsystem: Bundle.main.bundleIdentifier!, category: "parsing").error("\(error.localizedDescription)")
            do {
                self.entities = [try decoder.decode(T.self, from: data)]
            } catch {
                Logger(subsystem: Bundle.main.bundleIdentifier!, category: "parsing").error("\(error.localizedDescription)")
                return nil
            }
        }

        self.httpUrlResponse = httpUrlResponse
    }
}
