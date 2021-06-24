//
//  CategoriesPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation
import os.log

class HomePresenter {
    
    // MARK: - Properties
    private var categoryAdapter: CategoryAdapterProtocol
    private var productAdapter: ProductAdapterProtocol
    private var view: HomeViewProtocol
    private var error: NetworkingError
    private var errorLoadingData: Bool

    init(categoryAdapter: CategoryAdapterProtocol,
         productAdapter: ProductAdapterProtocol,
         view: HomeViewProtocol) {
        self.categoryAdapter = categoryAdapter
        self.productAdapter = productAdapter
        self.view = view
        self.error = .cancelled
        self.errorLoadingData = false
    }
}


//MARK: CategoriesPresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    
    func loadCategories() {
        view.isLoadingObservable = true
        
        categoryAdapter.fetchCategories { [weak self] (data: Result<[CategoryModel], NetworkingError>) in
            guard let self = self else {
                return
            }
            
            switch data {
            case .success(let categories):
                var categoriesWithImage = [CategoryModel]()
                
                let dispatchGroup = DispatchGroup()
                
                categories.forEach { (category: CategoryModel) in
                    dispatchGroup.enter()
                    
                    self.categoryAdapter.fetchCategory(withId: category.id) {(categoryDetail: Result<CategoryModel, NetworkingError>) in
                        
                        switch categoryDetail {
                        case .success(let categoryDetail):
                            
                            let categoryWithImage = Category(id: category.id,
                                                             name: category.name,
                                                             picture: categoryDetail.picture)
                            
                            categoriesWithImage.append(categoryWithImage.model)
                            
                            dispatchGroup.leave()
                            
                        case .failure(_):
                            dispatchGroup.leave()
                        }
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    DispatchQueue.main.async {
                        self.handleCompletionCategoriesApiCall(response: categoriesWithImage)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.handleErrorWhenLoadingCategories(self.errorDescription(error))
                }
            }
        }
    }
    
    func loadProducts(byText text: String) {
        view.isLoadingObservable  = true

        productAdapter.fetchProducts(byQuery: text) { [weak self] (response: Result<[ProductModel], NetworkingError>) in
            guard let self = self else {
                return
            }
            
            switch response {
            case .success(let products):
                DispatchQueue.main.async {
                    self.handleCompletionProductApiCall(response: products)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.handleErrorWhenLoadingCategories(self.errorDescription(error))
                }
            }
            
        }
    }
}

// MARK: - Propagate states view

extension HomePresenter {
    
    private func handleCompletionCategoriesApiCall(response: [CategoryModel]) {
        view.refreshCategoriesCards(data: response)
        view.isLoadingObservable = false
    }
    
    private func handleCompletionProductApiCall(response: [ProductModel]) {
        view.refreshProductsCards(data: response)
        view.isLoadingObservable = false
    }
    
    private func handleErrorWhenLoadingCategories(_ errorDescription: String) {
        view.showErrorObservable = true
    }
    
    private func errorDescription(_ error: NetworkingError) -> String {
        guard error.localizedDescription.isEmpty else {
            return Constants.Categories.Localizable.alertErrorDescription
        }
        return error.localizedDescription
    }
}
