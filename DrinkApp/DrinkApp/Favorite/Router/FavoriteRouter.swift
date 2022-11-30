//
//  FavoriteRouter.swift
//  DrinkApp
//
//  Created by Wellington on 26/10/22.
//

import UIKit

class FavoriteRouter {
    
    func getViewController() -> UINavigationController {
        
        let favoriteViewController = FavoriteViewController()
        let navigation = UINavigationController(rootViewController: favoriteViewController)
        
        let presenter = FavoritePresenter()
        
        favoriteViewController.setUp(presenter: presenter)
        
        presenter.setUp(delegate: favoriteViewController)
        
        return navigation
    }
}
