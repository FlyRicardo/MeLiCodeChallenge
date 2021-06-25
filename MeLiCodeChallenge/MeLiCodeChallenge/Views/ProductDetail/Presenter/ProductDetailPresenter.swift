//
//  ProductDetailPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/06/21.
//

import Foundation

class ProductDetailPresenter {
    
    private var productDetailAdapter: ProductDetailAdapterProtocol
    private var view: ProductDetailViewProtocol
    private var error: NetworkingError
    private var errorLoadingData: Bool
    
    init(productDetailAdapter: ProductDetailAdapterProtocol,
         view: ProductDetailViewProtocol) {
        self.productDetailAdapter = productDetailAdapter
        self.view = view
        self.error = .cancelled
        self.errorLoadingData = false
    }
}


//MARK: ProductPresenterProtocol
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
    func loadProductDetail(byProductId productId: String) {
        productDetailAdapter.fetchProductsDetail(byProductId: productId) { [weak self] (result: Result<ProductDetailModel, NetworkingError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let productDetail):
                self.handleCompletionProductApiCall(response: productDetail)
            case .failure(let error):
                self.handleErrorWhenLoadingData(error.localizedDescription)
            }
        }
    }
}

// MARK: - Propagate view states
extension ProductDetailPresenter {
    
    private func handleCompletionProductApiCall(response: ProductDetailModel) {
        view.refreshProductDetail(data: response)
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
