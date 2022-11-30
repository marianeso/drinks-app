//
//  HomeInteractor.swift
//  DrinkApp
//
//  Created by Wellington on 30/10/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func fetchDrinks(inicialDrinkValue: String)
}

// Passo 1: Criação do protocolo delegate
protocol HomeInteractorDelegate: AnyObject {
    func didFetchDrinks(drinks: [Drink])
}

class HomeInteractor: HomeInteractorProtocol {
  
    // Passo 2: Criar a variável delegate
    weak var delegate: HomeInteractorDelegate?
    
    private let drinkManager = DrinkManager ()


    func fetchDrinks(inicialDrinkValue: String) {
        
        self.drinkManager.fetchDrinksWithCompletion(inicialDrinkValue: inicialDrinkValue) { drinks in
            self.delegate?.didFetchDrinks(drinks: drinks ?? [])
        }
    }

}
