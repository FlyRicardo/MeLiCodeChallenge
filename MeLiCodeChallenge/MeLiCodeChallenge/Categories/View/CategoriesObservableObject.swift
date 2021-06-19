//
//  CategoriesViewController.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 16/06/21.
//

import Foundation
import SwiftUI
import os.log

protocol CategoriesObservableObjectProtocol {
    func changeUrl(_ url: URL)
}

class CategoriesObservableObject: ObservableObject {
    
    //MARK: - Variables
    private lazy var presenter: CategoriesPresenterProtocol = {
        return CategoriesPresenterFactory(observableObject: self).presenter
    }()
    
    weak var coordinator: CategoriesCoordinator?
    
    //MARK: Publised Variables
    @Published var url: URL!
    
    //MARK: - Constructor
    init(coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
        loadView()
    }
    
    private func loadView() {
        self.presenter.loadData { (result: Result<[Categories], NetworkingError>) in
            switch result {
            case .success(let categories):
                print(categories)
                
                Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying Categories").error("Error Displaying Categories")
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension CategoriesObservableObject : CategoriesObservableObjectProtocol {
    func changeUrl(_ url: URL) {
        self.url = url
    }
}
