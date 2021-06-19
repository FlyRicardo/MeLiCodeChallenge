//
//  CategoriesPresenter.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 12/06/21.
//

import Foundation

class CategoriesPresenter {
    
    // MARK: - Properties

    private var adapter: CategoriesAdapterProtocol
    private var observableObject: CategoriesObservableObjectProtocol
    
    init(adapter: CategoriesAdapter,
         observableObject: CategoriesObservableObjectProtocol) {
        self.adapter = adapter
        self.observableObject = observableObject
    }
}


//MARK: CategoriesPresenterProtocol

extension CategoriesPresenter: CategoriesPresenterProtocol {
    func loadData(handler: @escaping (Result<[Categories], NetworkingError>) -> Void) {
        adapter.fetchCategories { [weak self] (data: Result<[Categories], NetworkingError>) in
            guard let self = self else {
                return
            }
            
            switch data {
            case .success(let categories):
                if let url = URL(string: "http://http2.mlstatic.com/D_613443-MLA44574482913_012021-O.jpg") {
                    self.observableObject.changeUrl(url)
                }
                handler(.success(categories))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
