//
//  ProfileStorage.swift
//  DrinkApp
//
//  Created by Wellington on 28/04/22.
//

import UIKit

class ProfileStorage {
      
    private let profileKey = "minha_chave"
    
    func save(value: String) {
        UserDefaults.standard.set(value, forKey: self.profileKey)
    }
    
    func retrive() -> String? {
        return UserDefaults.standard.string(forKey: self.profileKey)
    }
}
