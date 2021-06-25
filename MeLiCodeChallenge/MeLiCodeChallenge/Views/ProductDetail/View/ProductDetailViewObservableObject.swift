//
//  ProductDetailViewObservableObject.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation
import SwiftUI

class ProductDetailViewObservableObject: ObservableObject {
    
    //MARK: - Published Variables
    @Published var productDetail = ProductDetailModel(id: "",
                                                      title: "",
                                                      price: "",
                                                      currency: "",
                                                      pictures: [PictureModel](),
                                                      warranty: "",
                                                      shippingMode: "")
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    
    //MARK: Private Variables
    private lazy var presenter: ProductDetailPresenterProtocol = {
        return ProductDetailPresenterFactory(observableObject: self).presenter
    }()
    
    @State var errorDescription: String = ""
    
    //MARK: - Variables
    weak var coordinator: HomeCoordinator?
    
    //MARK: - Constructor
    init(coordinator: HomeCoordinator,
         productId id: String) {
        self.coordinator = coordinator
        productDetail(productId: id)
    }
    
}

//MARK: ProductDetailViewProtocol

extension ProductDetailViewObservableObject: ProductDetailViewProtocol {
    func refreshProductDetail(data: ProductDetailModel) {
        productDetail = data
    }
    
    var showErrorObservable: Bool {
        get {
            return showError
        }
        set {
            showError = newValue
        }
    }
    
    var isLoadingObservable: Bool {
        get {
            return isLoading
        }
        set {
            isLoading = newValue
        }
    }
    
    
}

//MARK: ProductDetailPresenter comunication

extension ProductDetailViewObservableObject {
    private func productDetail(productId: String) {
        presenter.loadProductDetail(byProductId: productId)
    }
}
