//
//  Picture+Model.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation

extension Picture {
    var model: PictureModel {
        return PictureModel(id: id,
                            url: URL(string: url),
                            size: size,
                            maxSize: maxSize)
    }
}
