//
//  HomeRouter.swift
//  DrinkApp
//
//  Created by Wellington on 03/11/22.
//
import UIKit

class HomeRouter {
    
    func getViewController() -> UINavigationController {
                
        let homeViewController = HomeViewController()
        let navigation = UINavigationController(rootViewController: homeViewController)
        
        return navigation
    }
}
