//
//  ProductItemLabelsView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 23/06/21.
//

import Foundation
import SwiftUI

struct ProductItemLabelsView: View {

    @State var product: ProductModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .multilineTextAlignment(.leading)
                .lineLimit(2)

            HStack {
                Text("\(product.price)")
                    .font(.title)
                    .padding(.top, 5)
                Text(product.currency)
                    .font(.system(size: 15))
                    .padding(.top, 5)
                    .foregroundColor(Colors.green)
            }
            .padding(.leading, 5)

            HStack {
                Text(product.installment)
                    .font(.system(size: 15))
                    .font(.title)
                    .foregroundColor(Colors.green)
            }

            Text(product.shippingCost)
                .font(.system(size: 14))
                .padding(.top, 5)
                .foregroundColor(Colors.green)
        }
    }
}


struct ProductPriceTextView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemLabelsView(product: ProductModel(id: "1",
                                                    title: "Portatil Lenovo Amd Athon Gold 4gb 128 gb Ssd W10 Pro 14' Hd",
                                                    price: "300.000",
                                                    thumbnailUrl: URL(string:""),
                                                    currency: "COP",
                                                    installment: "",
                                                    shippingCost: "Free"))
    }
}
