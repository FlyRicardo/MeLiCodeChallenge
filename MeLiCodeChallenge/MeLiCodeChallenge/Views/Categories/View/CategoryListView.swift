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
            //Search Bar
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Colors.yellow, .white]), startPoint: .center, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 90)
                
                SearchBarView(text: $categoryListObservableObject.searchText, searchByProduct: $categoryListObservableObject.searchByProduct)
                    
            }
            if categoryListObservableObject.isLoading {
                //Loading Shimmer Animation
                ScrollView {
                    VStack {
                        ForEach(0...1, id: \.self) { raw in
                            ListAnimationView()
                                .frame(height: 180)
                                .padding()
                        }
                    }
                }
                .padding(.bottom, 1)
            }
            else if categoryListObservableObject.searchByProduct {
                ScrollView {
                    LazyVStack {
                        ForEach(categoryListObservableObject.products, id: \.id) { product in
                            let productItemObservableObject = ProductItemObservableObject(product: product)
                            ProductItemView(productItemObservableObject: productItemObservableObject)
                        }
                    }
                }
            }
            else {
                ScrollView {
                    LazyVStack {
                        ForEach(categoryListObservableObject.categories, id: \.id) { category in
                            let categoryItemObservableObject = CategoryItemObservableObject(category: category)
                            CategoryItemView(categoryItemObservableObject: categoryItemObservableObject)
                                .onTapGesture {
                                    categoryListObservableObject.coordinator?.navigateToProduct(withProductId: category.id)
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
        }.alert(isPresented: $categoryListObservableObject.showError) { () -> Alert in
            Alert(title: Text(Constants.Categories.Localizable.alertErrorDescription),
                  message: Text(categoryListObservableObject.errorDescription),
                  dismissButton: .default(Text(Constants.Categories.Localizable.alertErrorButton)))
            
        }
    }
}

struct CategoryListView_Preview: PreviewProvider {
    
    static let navigationController = UINavigationController()
    static let categoriesCoordinator = CategoriesCoordinator(navigationController: navigationController)
    static let categoryListObservableObject = CategoryListObservableObject(coordinator: categoriesCoordinator)
    
    static var previews: some View {
        CategoryListView(categoryListObservableObject: categoryListObservableObject)
    }
}
