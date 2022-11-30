//
//  HomePresenter.swift
//  DrinkApp
//
//  Created by Wellington on 03/11/22.
//

protocol HomePresenterProtocol {
    func viewDdidLoad()
    func didSelectLetter(letter: String)
}

// Passo 1: Criação do protocolo delegate
protocol HomePresenterDelegate: AnyObject {
    func loadDrinks(drinks: [Drink])
}

class HomePresenter {
    
    weak var delegate: HomePresenterDelegate?
    
    let interactor = HomeInteractor()
    
    init() {
        self.interactor.delegate = self
    }
    
    func viewDdidLoad() {
        self.interactor.fetchDrinks(inicialDrinkValue: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")
    }

    func didSelectLetter(letter: String) {
        self.interactor.fetchDrinks(inicialDrinkValue: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=" + letter)
    }

}


extension HomePresenter: HomeInteractorDelegate {
    
    func didFetchDrinks(drinks: [Drink]) {
        self.delegate?.loadDrinks(drinks: drinks)
    }
}
