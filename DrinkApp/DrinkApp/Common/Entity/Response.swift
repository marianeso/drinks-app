//
//  Response.swift
//  DrinkApp
//
//  Created by Wellington on 08/03/22.
//

import Foundation

class Response: Codable {
    let drinks: [Drink]

    init(drinks: [Drink]) {
        self.drinks = drinks  //variavel da classe passa a ter valor
    }
}
