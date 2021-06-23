//
//  CategoryListObservableObject.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import Foundation
import SwiftUI
import os.log

class CategoryListObservableObject: ObservableObject {
    
    //MARK: Publised Variables
    @Published var categories: [CategoryModel] = []
    @Published var products: [ProductModel] = []
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    
    //MARK: State variables
    @State var searchText: String = ""
    @State var searchByProduct: Bool = false {
        didSet {
            loadProducts(byText: searchText)
        }
    }
    @State var errorDescription: String = ""
    
    //MARK: Private Variables
    private lazy var presenter: CategoryListPresenterProtocol = {
        return CategoryListPresenterFactory(observableObject: self).presenter
    }()
    
    weak var coordinator: CategoriesCoordinator?
    
    //MARK: - Constructor
    init(coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
        self.loadCategories()
    }

}

//MARK: CategoryListObservableObjectProtocol

extension CategoryListObservableObject: CategoryListViewProtocol {
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
}


//MARK: CategoryListPresenter comunication

extension CategoryListObservableObject {
    
    private func loadCategories() {
        self.presenter.loadCategories()
    }
    
    private func loadProducts(byText: String) {
//        self.presenter.
    }

}
