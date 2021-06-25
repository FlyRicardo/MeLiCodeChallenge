//
//  CategoriesView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation
import SwiftUI
import Kingfisher

struct HomeView: View {
    
    //MARK: - States
    @StateObject var homeViewObservableObject: HomeViewObservableObject
    
    var body: some View {
        //Categories List
        VStack {
            //Search Bar
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Colors.yellow, .white]), startPoint: .center, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 90)
                
                SearchBarView(text: $homeViewObservableObject.searchText, searchByProduct: $homeViewObservableObject.searchByProduct)
                    
            }
            if homeViewObservableObject.isLoading {
                //Loading Shimmer Animation
                ScrollView {
                    VStack {
                        ForEach(0...2, id: \.self) { raw in
                            ListAnimationView()
                                .frame(height: 180)
                                .padding()
                        }
                    }
                }
                .padding(.bottom, 1)
            }
            else if homeViewObservableObject.searchByProduct {
                ScrollView {
                    LazyVStack {
                        ForEach(homeViewObservableObject.products, id: \.id) { product in
                            let productItemObservableObject = ProductItemObservableObject(product: product)
                            ProductItemView(productItemObservableObject: productItemObservableObject)
                                .onTapGesture {
                                    homeViewObservableObject.coordinator?.navigateToProduct(withProductId: product.id)
                                }
                        }
                        .frame(height: 180)
                        .padding()
                    }
                }
                .padding(.bottom, 1)
            }
            else {
                ScrollView {
                    LazyVStack {
                        ForEach(homeViewObservableObject.categories, id: \.id) { category in
                            let categoryItemObservableObject = CategoryItemObservableObject(category: category)
                            CategoryItemView(categoryItemObservableObject: categoryItemObservableObject)
                                .onTapGesture {
                                    homeViewObservableObject.coordinator?.navigateToProduct(withcategoryId: category.id)
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
        }.alert(isPresented: $homeViewObservableObject.showError) { () -> Alert in
            Alert(title: Text(Constants.Categories.Localizable.alertErrorDescription),
                  message: Text(homeViewObservableObject.errorDescription),
                  dismissButton: .default(Text(Constants.Categories.Localizable.alertErrorButton)))
            
        }
    }
}

struct CategoryListView_Preview: PreviewProvider {
    
    static let navigationController = UINavigationController()
    static let homeCoordinator = HomeCoordinator(navigationController: navigationController)
    static let homeViewObservableObject = HomeViewObservableObject(coordinator: homeCoordinator)
    
    static var previews: some View {
        HomeView(homeViewObservableObject: homeViewObservableObject)
    }
}
