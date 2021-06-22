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
    
    //MARK: State variables
    @State var searchText: String = ""
    @State var searchByProduct: Bool = false {
        didSet {
            loadProducts()
        }
    }
    
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

    func refreshCards(data: [Category]) {
        self.categories = data
    }
    
    func hideLoading() {

    }
    
    func showLoading() {

    }
    
    func showError() {

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
