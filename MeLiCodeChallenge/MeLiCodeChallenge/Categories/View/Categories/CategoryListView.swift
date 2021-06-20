//
//  CategoriesView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation
import SwiftUI
import Kingfisher

struct CategoryListView: View {
    
    //MARK: - States
    @StateObject var categoryListObservableObject: CategoryListObservableObject
    
    var body: some View {

        //Categories List
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(categoryListObservableObject.categories, id: \.id) { category in
                        let categoryItemObservableObject = CategoryItemObservableObject(category: category)
                        CategoryItemView(categoryItemObservableObject: categoryItemObservableObject)
                            .onTapGesture {
//                                homeViewModel.navigateToCategory(withCategoryId: category.id)
                            }
                            .id(UUID())
                            .frame(height: categoryItemObservableObject.itemHeight)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .padding(.bottom, 25)
                            
                    }
                }
            }
            .padding(.bottom, 1)
        }
    }
}
