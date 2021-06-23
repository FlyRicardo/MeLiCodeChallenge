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
    @Published var categories: [Category] = []
    @Published var items: [Item] = []
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    
    //MARK: State variables
    @State var searchText: String = ""
    @State var searchByProduct: Bool = false {
        didSet {
            loadProducts()
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

extension CategoryListObservableObject: CategoryListObservableObjectProtocol {
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

    func refreshCards(data: [Category]) {
        categories = data
    }
}


//MARK: CategoryListPresenter comunication

extension CategoryListObservableObject {
    
    private func loadCategories() {
        self.presenter.loadData()
    }
    
    private func loadProducts() {
        
    }

}
