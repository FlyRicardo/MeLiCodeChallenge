//
//  MeLiEntityDecodable.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 18/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

struct ResponseDTO: Decodable {
    enum CodingKeys : String, CodingKey {
          case siteId = "site_id"
          case items = "results"
    }
    let siteId: String
    let items: [ItemsDTO]
}


public struct ItemsDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case installments = "installments"
        case shipping = "shipping"
        case seller = "seller"
        case thumbnail = "thumbnail"
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
    }
    let id: String
    let title: String
    let price: Float
    let installments: InstallmentsDTO
    let shipping: ShippingDTO
    let seller: SellerDTO?
    let thumbnail: String
    let currencyId: String?
    let availableQuantity: Int?
}

struct SellerDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case profileLink = "permalink"
        case sellerReputation = "seller_reputation"
        case eshop = "eshop"
    }
    let id: Int
    let profileLink: String
    let sellerReputation: SellerReputationDTO
    let eshop: EshopDTO?
}

struct EshopDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case nickName = "nick_name"
    }
    let nickName: String
}

struct ShippingDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case freeShipping = "free_shipping"
    }
    let freeShipping: Bool
}

struct InstallmentsDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case currencyId = "currency_id"
        case quantity = "quantity"
        case amount = "amount"
        case rate = "rate"
    }
    let quantity: Int
    let amount: Float
    let rate: Float
    let currencyId: String
}

struct SellerReputationDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case level = "level_id"
        case status = "power_seller_status"
        case transactions = "transactions"
        case metrics = "metrics"
    }
    
    let level: String?
    let status: String?
    let transactions: TransactionsDTO
    let metrics: MetricsDTO
}

struct TransactionsDTO: Decodable {
    let canceled : Int
    let completed: Int
    let total: Int
    let ratings: RatingsDTO
}

struct RatingsDTO: Decodable {
    let negative: Float
    let neutral: Float
    let positive: Float
}

struct MetricsDTO: Decodable {
    enum CodingKeys : String, CodingKey {
        case sales = "sales"
        case claims = "claims"
        case delayed = "delayed_handling_time"
        case cancellations = "cancellations"
    }
    let sales: MetricSalesDTO? // Missing on some items
    let claims: MetricDelayClaimCancellationDTO?
    let delayed: MetricDelayClaimCancellationDTO?
    let cancellations:MetricDelayClaimCancellationDTO?
}

//Sales
struct MetricSalesDTO: Decodable {
    let period: String
    let completed: Int
}

// Delay, claim and cancellation
struct MetricDelayClaimCancellationDTO: Decodable {
    let period: String
    let rate: Float
    let value: Int
}

// MARK - View models protocol

extension ItemsDTO: SearchItemViewModelProtocol {
    var thumbnailUrl: String {
        return thumbnail
    }
    
    var descriptionText: String {
        return title
    }
    
    var priceText: String {
        return price.currencyFormat()
    }
    
    var installmentText: String {
        return "\(installments.amount.currencyFormat())x \(installments.quantity)"
    }
    
    var shippingModeText: String {
        return shipping.freeShipping ? "Envío gratis" : ""
    }
}

extension ItemsDTO: ItemDetailViewModelProtocol {
    var imageUrl: String {
        return thumbnail
    }

    var availableStockText: String {
        guard let _availableQuantity = availableQuantity else {
            return ""
        }
        return _availableQuantity > 0 ? "Stock disponible" : ""
    }

    var nickNameText: String? {
        return seller?.eshop?.nickName
    }

    var levelText: String? {
        return seller?.sellerReputation.level
    }

    var negativeRating: String? {
        return seller?.sellerReputation.transactions.ratings.negative.percentageFormat()
    }

    var positiveRatings: String? {
        return seller?.sellerReputation.transactions.ratings.positive.percentageFormat()
    }

    var neutraRating: String? {
        return seller?.sellerReputation.transactions.ratings.neutral.percentageFormat()
    }

    var claimsRate: String? {
        return seller?.sellerReputation.metrics.claims?.rate.percentageFormat()
    }

    var delayHandlingRate: String? {
        return seller?.sellerReputation.metrics.delayed?.rate.percentageFormat()
    }

    var cancellationsRate: String? {
        return String(seller?.sellerReputation.metrics.sales?.completed ?? 0)
    }
}
