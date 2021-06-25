//
//  CategoryListObservableObject.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import Foundation
import SwiftUI
import os.log

class HomeViewObservableObject: ObservableObject {
    
    //MARK: Publised Variables
    @Published var categories: [CategoryModel] = []
    @Published var products: [ProductModel] = []
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    
    //MARK: State variables
    var searchText: String = ""
    var searchByProduct: Bool = false {
        didSet {
            loadProducts(text: searchText)
        }
    }
    @State var errorDescription: String = ""
    
    //MARK: Private Variables
    private lazy var presenter: HomePresenterProtocol = {
        return HomePresenterFactory(observableObject: self).presenter
    }()
    
    weak var coordinator: HomeCoordinator?
    
    //MARK: - Constructor
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        self.loadCategories()
    }

}

//MARK: CategoryListObservableObjectProtocol

extension HomeViewObservableObject: HomeViewProtocol {
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

    func refreshCategoriesCards(data: [CategoryModel]) {
        categories = data
    }
    
    func refreshProductsCards(data: [ProductModel]) {
        products = data
    }
}


//MARK: HomeViewListPresenter comunication

extension HomeViewObservableObject {
    
    private func loadCategories() {
        self.presenter.loadCategories()
    }
    
    private func loadProducts(text: String) {
        self.presenter.loadProducts(byText: text)
    }

}
