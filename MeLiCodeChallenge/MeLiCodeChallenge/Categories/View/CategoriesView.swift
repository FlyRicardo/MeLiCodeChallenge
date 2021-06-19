//
//  CategoriesView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation
import SwiftUI
import Kingfisher

struct CategoriesView: View {
    
    //MARK: - States
    @StateObject var categoryViewController: CategoriesObservableObject
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()

            KFImage(categoryViewController.url)
                .resizable()
                    .frame(width: 128, height: 128)
                    .cornerRadius(20)
                    .shadow(radius: 5)
        }
    }
}
