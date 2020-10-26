//
//  MeLiEntity.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 17/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import Foundation

// MARK: Seler Protocols

/// Representarion of a MeLi seller
///
/// `MeLiSellerProtocol` is a `Qualifiable` type,
///  which means it also contains all reputatoin info of the MeLi seller.
///
protocol MeLiSellerProtocol: Qualifiable{
    var id: Int {get}
    var nickName: String {get}
    var profileLink: String {get}
}

/// Wrapper type that contains MeLi saller info in terms of *rating*, *metrics*, *status* and *transactions*
///
/// `Qualifiable` is a `Ratable` and `Measurable` type.
///
protocol Qualifiable: Ratable, Mesurable{
    var level: String {get}
    var powerStatus: String {get}
    var transactions: Transactions {get}
}

/// Type to be conformed for a seller if he/she wants to acces to the detailed transactions info
protocol Transactions {
    var total: Int {get}
    var canceled: Int {get}
    var period: String {get}
}

/// Type to be conformed for a seller if he/she wants to acces to the *positive*, *negative* and *neutral* qualifications
protocol Ratable {
    var negative: Float {get}
    var positive: Float {get}
    var neutral: Float {get}
}

/// A performance summary of a MeLi saller
///
/// `Mesurable` uses `MetricProtocol` and `SaleProtocol` types
protocol Mesurable {
    var claims: MetricProtocol {get}
    var delayedHandlingTime: MetricProtocol {get}
    var sales: MetricProtocol {get}
    var cancellations: MetricProtocol {get}
}

/// Type that represented detailed info of  *claims*, *sales* and *cancellations*
protocol MetricProtocol {
    var metricRate: Float {get}
    var metricValue: Int {get}
    var metricPeriod: String {get}
}

// MARK: Item Protocols

/// Blueprint of items API response
///
/// The `MeLiEntityProtocol` expose the contract that an object must be conform
/// in order to be considered a MeLiEntity item
///
protocol MeLiEntityProtocol {
    var id: String {get}
    var title: String {get}
    var sellerEntity: MeLiSellerProtocol {get}
}
