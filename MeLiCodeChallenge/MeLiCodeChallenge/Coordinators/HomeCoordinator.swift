//
//  HomeCoordinator.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 19/06/21.
//

import SwiftUI
import os.log

class HomeCoordinator {
    var navigationController: UINavigationController
    
    //MARK: - Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        setUpNavigationController()
        setUpRootViewController()
    }
}

extension HomeCoordinator: Coordinator {
    
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
    
    func navigateToProduct(withcategoryId categoryId: String) {
        let productListObservableObject = ProductListViewObservableObject(coordinator: self, categoryId: categoryId)
        let vc = UIHostingController(rootView: ProductListView(productListObservableObject: productListObservableObject))
        vc.title = Constants.Products.Localizable.titleList
        self.navigationController.pushViewController(vc, animated: true)
        
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying products by category").error("Displaying Products Successfully")
    }
    
    func navigateToProduct(withProductId productId: String) {
        let productDetailViewObservableObject = ProductDetailViewObservableObject(coordinator: self, productId: productId)
        let vc = UIHostingController(rootView: ProductDetailView(productDetailViewObservableObject: productDetailViewObservableObject))
        vc.title = Constants.Products.Localizable.titleDetail
        self.navigationController.pushViewController(vc, animated: true)
        
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Displaying Products").error("Showing Products Successfully")
    }
}
