//
//  ProductDetailView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    
    @StateObject var productDetailViewObservableObject: ProductDetailViewObservableObject
    private let imageSize = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Colors.yellow)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 1)
            
            if productDetailViewObservableObject.isLoading {
                VStack {
                    Spacer()
                    LoaderSpinnerAnimationView()
                    Spacer()
                }
            }
            else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        TabView() {
                            ForEach(productDetailViewObservableObject.productDetail.pictures, id: \.id) { picture in
                                KFImage(picture.url)
                                    .placeholder {
                                        // Placeholder while downloading
                                        Image("DefaultImage", bundle: nil)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: imageSize, height: imageSize, alignment: .center)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        
                        VStack(alignment: .leading) {
                            Text(productDetailViewObservableObject.productDetail.title)
                                .font(.title)
                                .padding(.top, 10)
                            HStack {
                                Text(productDetailViewObservableObject.productDetail.price)
                                    .font(.title)
                                    .padding(.top, 15)
                                Text(productDetailViewObservableObject.productDetail.currency)
                                    .font(.system(size: 14))
                                    .padding(.top, 5)
                                    .foregroundColor(Colors.green)
                            }
                            
                            Text(productDetailViewObservableObject.productDetail.warranty)
                                .foregroundColor(Colors.darkGray)
                                .padding(.top, 5)
                            
                            HStack {
                                Image(systemName: "car")
                                    .foregroundColor(Colors.green)
                                Text(productDetailViewObservableObject.productDetail.shippingMode)
                                    .foregroundColor(Colors.green)
                            }
                            .padding(.top, 20)
                        }
                    }
                }
                .padding()
            }
        }
        .alert(isPresented: $productDetailViewObservableObject.showError) { () -> Alert in
            Alert(title: Text(Constants.Categories.Localizable.alertErrorDescription),
                  message: Text(productDetailViewObservableObject.errorDescription),
                  dismissButton: .default(Text(Constants.Categories.Localizable.alertErrorButton)))
            
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    
    static let navController = UINavigationController()
    static let coordinator = HomeCoordinator(navigationController: navController)
    static let productDetailViewObservableObject = ProductDetailViewObservableObject(coordinator: coordinator, productId:"")
    
    static var previews: some View {
        ProductDetailView(productDetailViewObservableObject: productDetailViewObservableObject)
    }
}

