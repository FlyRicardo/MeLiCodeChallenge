//
//  CategoriesViewController.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 16/06/21.
//

import Foundation
import SwiftUI
import os.log

class CategoryItemObservableObject: ObservableObject {
    
    //MARK: - Variables

    //MARK: Publised Variables
    @Published var url: URL!
    @Published var itemHeight: CGFloat = 0
    @Published var name: String = ""
    
    //MARK: - Constructor
    init(category: Category) {
        self.name = category.name
        self.url = URL(string: category.picture ?? "DefaultImage")
        getCategoryItemHeight()
    }

    
    //MARK: UI Business Rules
    func getCategoryItemHeight() {
        // 0.9594 -> Aspect ratio W/H defined to resize the CategoryListItem to looks like a portrait rectangle image
        // 20 -> Widht padding used in the CategoryListItem
        let viewWidth = UIScreen.main.bounds.width
        let height = (viewWidth - 20) / 0.9594
        itemHeight = height
    }
}
