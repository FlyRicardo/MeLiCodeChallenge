//
//  CategoriesCoordinator.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import SwiftUI
import os.log

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
    
    
    //MARK: - Navigation
    
    func setUpRootViewController() {
        let homeViewObservableObject = HomeViewObservableObject(coordinator: self)
        let viewController = UIHostingController(rootView: HomeView(homeViewObservableObject: homeViewObservableObject))
        viewController.title = Constants.Categories.Localizable.title
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToProduct(withProductId id: String) {
        let productListObservableObject = ProductListObservableObject()
        let vc = UIHostingController(rootView: ProductListView())
        vc.title = Constants.Categories.Localizable.title
        self.navigationController.pushViewController(vc, animated: true)
        
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying Products").error("Displaying Products Successfully")
    }
}
