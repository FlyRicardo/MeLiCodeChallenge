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
        loadCategories()
    }

}

//MARK: CategoryListObservableObjectProtocol

extension CategoryListObservableObject: CategoryListObservableObjectProtocol {
    func setCategories(_ categories: [Category]) {
        presenter.loadData { [weak self] (data: Result<[Category], NetworkingError>) in
            guard let self = self else {
                return
            }

            switch data {
            case .success(let categories):
                self.categories = categories
            case .failure(let error):
                // TODO: Display error view
                print(error)
            }
        }
    }
    
    func setUrl(_ url: URL) {
        // TODO: 
    }
}

extension CategoryListObservableObject {
    
    private func loadCategories() {
        self.presenter.loadData { (result: Result<[Category], NetworkingError>) in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.categories = categories
                    Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying Categories").error("Error Displaying Categories")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func loadProducts() {
    }

}
