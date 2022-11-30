//
//  FavoriteInteractor.swift
//  DrinkApp
//
//  Created by Wellington on 25/10/22.
//

protocol FavoriteInteractorProtocol {
    func getDrinks()
    func setUp(delegate: FavoriteInteractorDelegate)
}

protocol FavoriteInteractorDelegate: AnyObject {
    func didGetDrinks(drinks: [String : Drink])
}

class FavoriteInteractor: FavoriteInteractorProtocol {
  
    weak var delegate: FavoriteInteractorDelegate?
    
    private let drinkStorage: DrinkStorageProtocol = DrinkStorage()


    func setUp(delegate: FavoriteInteractorDelegate) {
        self.delegate = delegate
    }
    
    func getDrinks() {
        let drinks = self.drinkStorage.getDrinks() ?? [:]
        self.delegate?.didGetDrinks(drinks: drinks)
    }
}
