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
        let categoriesObservableObject = CategoriesObservableObject(coordinator: self)
        let viewController = UIHostingController(rootView: CategoriesView(categoryViewController: categoriesObservableObject))
        viewController.title = "navigation.title.home"
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
