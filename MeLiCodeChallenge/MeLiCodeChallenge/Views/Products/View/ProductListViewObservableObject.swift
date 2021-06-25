//
//  ProductListObservableObject.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 20/06/21.
//

import Foundation
import SwiftUI

class ProductListViewObservableObject : ObservableObject {
    
    //MARK: Publised Variables
    @Published var products: [ProductModel] = []
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    
    //MARK: State variables
    var searchText: String = ""
    var searchByProduct: Bool = false {
        didSet {
            loadProducts(byQuery: searchText)
        }
    }
    @State var errorDescription: String = ""
    
    //MARK: Private Variables
    private lazy var presenter: ProductPresenterProtocol = {
        return ProductPresenterFactory(observableObject: self).presenter
    }()
    
    weak var coordinator: HomeCoordinator?
    
    //MARK: - Constructor
    init(coordinator: HomeCoordinator,
         categoryId: String) {
        self.loadProducts(byCategory: categoryId)
        self.coordinator = coordinator
    }
}

extension ProductListViewObservableObject : ProductListViewProtocol {
    func refreshProductsCards(data: [ProductModel]) {
        products = data
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

//MARK: HomeViewListPresenter comunication

extension ProductListViewObservableObject {
    private func loadProducts(byCategory category: String) {
        self.presenter.loadProducts(byCategory: category)
    }
    
    private func loadProducts(byQuery query: String) {
        self.presenter.loadProducts(byQuery: query)
    }
}

