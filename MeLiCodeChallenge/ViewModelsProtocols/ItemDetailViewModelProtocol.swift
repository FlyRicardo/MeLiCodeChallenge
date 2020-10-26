//
//  ItemDetailViewModelProtocol.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 25/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import Foundation

protocol ItemDetailViewModelProtocol {
    // View item attributes
    var imageUrl: String {get}
    var descriptionText: String {get}
    var priceText: String {get}
    var availableStockText: String {get}
    var installmentText: String {get}
    var shippingModeText: String {get}
    
    //View seller attributes
    var nickNameText: String? {get}
    var levelText: String? {get}
    
    //View seller rating
    var negativeRating: String? {get}
    var positiveRatings: String? {get}
    var neutraRating: String? {get}
    
    //View seller metrics
    var claimsRate: String? {get}
    var delayHandlingRate: String?{get}
    var cancellationsRate: String?{get}
}
