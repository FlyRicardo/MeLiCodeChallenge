//
//  CategoriesPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

class CategoryListPresenter {
    
    // MARK: - Properties

    private var adapter: CategoryListAdapterProtocol
    private var observableObject: CategoryListObservableObjectProtocol
    
    init(adapter: CategoryListAdapter,
         observableObject: CategoryListObservableObjectProtocol) {
        self.adapter = adapter
        self.observableObject = observableObject
    }
}


//MARK: CategoriesPresenterProtocol

extension CategoryListPresenter: CategoryListPresenterProtocol {
    func loadData(handler: @escaping (Result<[Category], NetworkingError>) -> Void) {
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
                    
                    self.adapter.fetchCategory(withId: category.id) { (categoryDetail: Result<Category, NetworkingError>) in
                        
                        switch categoryDetail {
                        case .success(let categoryDetail):
                            
                            let categoryWithImage = Category(id: category.id,
                                     name: category.name,
                                     picture: categoryDetail.picture)
                            categoriesWithImage.append(categoryWithImage)
                            dispatchGroup.leave()
                            
                        case .failure(let error):
                            dispatchGroup.leave()
                            handler(.failure(error))
                        }
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    DispatchQueue.main.async {
                        handler(.success(categoriesWithImage))
//                        self.isLoading = false
                    }
                }
                handler(.success(categoriesWithImage))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
