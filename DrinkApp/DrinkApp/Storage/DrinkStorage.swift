//
//  DrinkStorage.swift
//  DrinkApp
//
//  Created by Wellington on 18/05/22.
//

import UIKit

protocol DrinkStorageProtocol {
    func getDrinks() -> [String : Drink]?
    func getDrink(drinkID: String) -> Drink?
    func save(drinkID: String, drink: Drink)
    func delete(drinkID: String)
}

final class DrinkStorage: DrinkStorageProtocol {
    
    // MARK: - Private Variables
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    private let drinksKey: String = "drinks"
    
    
    // MARK: - Public Methods
    
    // pega todos os drinks do user default
    func getDrinks() -> [String : Drink]? {
        guard let storageNote = self.userDefaults.object(forKey: self.drinksKey) as? Data else { return nil }
        let dictDrinks = try? JSONDecoder().decode([String : Drink].self, from: storageNote)
        return dictDrinks
    }
    
    // pega 1 drink específico
    func getDrink(drinkID: String) -> Drink? {
        let drinks:[String : Drink]? = self.getDrinks() ?? [:]
        return drinks?[drinkID]
    }
    
    // salva 1 drink específico
    func save(drinkID: String, drink: Drink) {
        let drinks:[String : Drink]? = self.getDrinks() ?? [:]  //DUVIDAAA
        
        let combinedDict = drinks?.merging([drinkID : drink]) { $1 }
        
        let dataEncoded = try? JSONEncoder().encode(combinedDict)
        self.userDefaults.set(dataEncoded, forKey: self.drinksKey)
    }
    
    // deleta 1 drink específico
   func delete(drinkID: String) {
       var drinks:[String : Drink]? = self.getDrinks() //DUVIDAAA
       
       drinks?.removeValue(forKey: drinkID)

       let dataEncoded = try? JSONEncoder().encode(drinks)
       self.userDefaults.set(dataEncoded, forKey: self.drinksKey)
   }
}
