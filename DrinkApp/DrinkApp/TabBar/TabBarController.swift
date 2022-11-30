//
//  TabBarController.swift
//  DrinkApp
//
//  Created by Wellington on 16/04/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .lightGray
        self.tabBar.unselectedItemTintColor = .init(red: 243, green: 243, blue: 243, alpha: 0.1)
        self.tabBar.tintColor = .init(red: 0, green: 0, blue: 0.5, alpha: 1.0)
        self.tabBar.barTintColor = .lightGray
        
        TabBarSettings()
    }
    
        // MARK: - TABBAR

        func TabBarSettings (){
            
            let homeNavigationController = HomeRouter().getViewController()
            let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
            homeNavigationController.tabBarItem = homeTabBarItem
            
            let favoriteViewController = FavoriteRouter().getViewController()
            let favoriteTabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star"), selectedImage: UIImage(named: "star"))
            favoriteViewController.tabBarItem = favoriteTabBarItem
            
            self.viewControllers = [homeNavigationController, favoriteViewController] //array que a tabbar recebe para inicializar
        }
    
}

