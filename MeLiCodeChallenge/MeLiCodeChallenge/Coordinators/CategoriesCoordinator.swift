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
        let categoryListObservableObject = CategoryListObservableObject(coordinator: self)
        let viewController = UIHostingController(rootView: CategoryListView(categoryListObservableObject: categoryListObservableObject))
        viewController.title = Constants.Categories.categoriesTitle
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToProduct(withProductId id: String) {
        let productListObservableObject = ProductListObservableObject()
        let vc = UIHostingController(rootView: ProductListView())
        vc.title = Constants.Products.productsTitle
        self.navigationController.pushViewController(vc, animated: true)
        
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying Products").error("Displaying Products Successfully")
    }
}
