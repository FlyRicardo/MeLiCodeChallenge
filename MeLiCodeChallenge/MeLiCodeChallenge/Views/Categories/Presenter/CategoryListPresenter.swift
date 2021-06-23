//
//  CategoriesPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation
import os.log

class CategoryListPresenter {
    
    // MARK: - Properties
    private var adapter: CategoryListAdapterProtocol
    private var view: CategoryListViewProtocol
    private var error: NetworkingError
    private var errorLoadingData: Bool

    init(adapter: CategoryListAdapter,
         view: CategoryListViewProtocol) {
        self.adapter = adapter
        self.view = view
        self.error = .cancelled
        self.errorLoadingData = false
    }
}


//MARK: CategoriesPresenterProtocol

extension CategoryListPresenter: CategoryListPresenterProtocol {
    func loadCategories() {
        
        adapter.fetchCategories { [weak self] (data: Result<[CategoryModel], NetworkingError>) in
            guard let self = self else {
                return
            }
            
            switch data {
            case .success(let categories):
                var categoriesWithImage = [CategoryModel]()
                
                let dispatchGroup = DispatchGroup()
                
                categories.forEach { (category: CategoryModel) in
                    dispatchGroup.enter()
                    
                    self.adapter.fetchCategory(withId: category.id) {(categoryDetail: Result<CategoryModel, NetworkingError>) in
                        
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
                        self.handleCompletionCategoriesAPICall(response: categoriesWithImage)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.handleErrorWhenLoadingCategories(self.errorDescription(error))
                }
            }
        }
    }
    
    func loadProducts() {
        
    }
}


// MARK: - Propagate states view

extension CategoryListPresenter {
    
    private func handleCompletionCategoriesAPICall(response: [CategoryModel]) {
        view.refreshCategoriesCards(data: response)
        view.isLoadingObservable = false
    }
    
    private func handleErrorWhenLoadingCategories(_ errorDescription: String) {
        view.showErrorObservable = true
    }
    
    func errorDescription(_ error: NetworkingError) -> String {
        guard error.localizedDescription.isEmpty else {
            return Constants.Categories.Localizable.alertErrorDescription
        }
        return error.localizedDescription
    }
}
