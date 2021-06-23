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
    init(category: CategoryModel) {
        self.name = category.name
        self.url = URL(string: category.picture ?? "DefaultImage")
        getCategoryItemHeight()
    }

    
    //MARK: UI Business Rules
    func getCategoryItemHeight() {
        let viewWidth = UIScreen.main.bounds.width
        let height = (viewWidth - 20) / 0.9594
        itemHeight = height
    }
}
