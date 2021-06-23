//
//  Category+Model.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

extension Category {
    var model: CategoryModel {
        return CategoryModel(id: id,
                             name: name,
                             picture: picture)
    }
}
