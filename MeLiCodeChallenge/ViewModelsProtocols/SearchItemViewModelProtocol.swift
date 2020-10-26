//
//  SearchItemViewModelProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

protocol SearchItemViewModelProtocol {
    var thumbnailUrl: String {get}
    var descriptionText: String {get}
    var priceText: String {get}
    var installmentText: String {get}
    var shippingModeText: String {get}
}
