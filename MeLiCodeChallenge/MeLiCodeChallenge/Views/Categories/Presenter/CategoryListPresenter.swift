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
    private var observableObject: CategoryListObservableObjectProtocol
    private var errorLoadingCategories: Bool
    private var isLoading: Bool

    init(adapter: CategoryListAdapter,
         observableObject: CategoryListObservableObjectProtocol) {
        self.adapter = adapter
        self.observableObject = observableObject
        errorLoadingCategories = false
        isLoading = false
    }
}


//MARK: CategoriesPresenterProtocol

extension CategoryListPresenter: CategoryListPresenterProtocol {
    func loadData() {
        
        adapter.fetchCategories { [weak self] (data: Result<[Category], NetworkingError>) in
            guard let self = self else {
                return
            }
            
            switch data {
            case .success(let categories):
                var categoriesWithImage = [Category]()
                
                let dispatchGroup = DispatchGroup()
                
                categories.forEach { (category: Category) in
                    dispatchGroup.enter()
                    
                    self.adapter.fetchCategory(withId: category.id) {(categoryDetail: Result<Category, NetworkingError>) in
                        
                        switch categoryDetail {
                        case .success(let categoryDetail):
                            
                            let categoryWithImage = Category(id: category.id,
                                                             name: category.name,
                                                             picture: categoryDetail.picture)
                            
                            categoriesWithImage.append(categoryWithImage)
                            
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
                    self.handleErrorOnLoadingCategories(error: error)
                }
            }
        }
    }
}


// MARK: - Loading state views

extension CategoryListPresenter {
    
    private func handleCompletionCategoriesAPICall(response: [Category]) {
        observableObject.refreshCards(data: response)
    }
    
    private func handleErrorOnLoadingCategories(error: Error) {
        
    }
}
