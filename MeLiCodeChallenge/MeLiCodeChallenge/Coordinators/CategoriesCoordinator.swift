//
//  CategoriesCoordinator.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import SwiftUI

class CategoriesCoordinator {
    var navigationController: UINavigationController
    
    //MARK: - Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        setUpNavigationController()
        setUpRootViewController()
    }
}

extension CategoriesCoordinator: Coordinator {
    
    //MARK: - SetUp
    func setUpNavigationController() {
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func setUpRootViewController() {
        let categoryListObservableObject = CategoryListObservableObject(coordinator: self)
        let viewController = UIHostingController(rootView: CategoryListView(categoryListObservableObject: categoryListObservableObject))
        viewController.title = "navigation.title.home"
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
