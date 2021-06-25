//
//  ProductPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

class ProductPresenter {
    
    private var productAdapter: ProductAdapterProtocol
    private var view: ProductListViewProtocol
    private var error: NetworkingError
    private var errorLoadingData: Bool
    
    init(productAdapter: ProductAdapterProtocol,
         view: ProductListViewProtocol) {
        self.productAdapter = productAdapter
        self.view = view
        self.error = .cancelled
        self.errorLoadingData = false
    }
}


//MARK: ProductPresenterProtocol
extension ProductPresenter: ProductPresenterProtocol {
    func loadProducts(byCategory categoryId: String) {
        view.isLoadingObservable  = true

        productAdapter.fetchProducts(byCategory: categoryId) { [weak self] (response: Result<[ProductModel], NetworkingError>) in
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
                    self.handleErrorWhenLoadingData(self.errorDescription(error))
                }
            }
            
        }
    }
    
    func loadProducts(byQuery query: String) {
        view.isLoadingObservable  = true

        productAdapter.fetchProducts(byQuery: query) { [weak self] (response: Result<[ProductModel], NetworkingError>) in
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
                    self.handleErrorWhenLoadingData(self.errorDescription(error))
                }
            }
            
        }
    }
}

// MARK: - Propagate states view
extension ProductPresenter {
    
    private func handleCompletionProductApiCall(response: [ProductModel]) {
        view.refreshProductsCards(data: response)
        view.isLoadingObservable = false
    }
    
    private func handleErrorWhenLoadingData(_ errorDescription: String) {
        view.showErrorObservable = true
    }
    
    private func errorDescription(_ error: NetworkingError) -> String {
        guard error.localizedDescription.isEmpty else {
            return Constants.Categories.Localizable.alertErrorDescription
        }
        return error.localizedDescription
    }
}
