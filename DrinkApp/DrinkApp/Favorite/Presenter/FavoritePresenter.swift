//
//  FavoritePresenter.swift
//  DrinkApp
//
//  Created by Wellington on 25/10/22.
//

protocol FavoritePresenterProtocol {
    func viewWillAppear()
    func setUp(delegate: FavoritePresenterDelegate)
}

protocol FavoritePresenterDelegate: AnyObject {
    func showDrinks(drinks: [String : Drink])
}

class FavoritePresenter: FavoritePresenterProtocol {
  
    weak var delegate: FavoritePresenterDelegate?
    
    private let interactor: FavoriteInteractorProtocol

    // Inicializador da classe
    // responsavel pela inicializacao das variaveis
    init(interactor: FavoriteInteractorProtocol = FavoriteInteractor()) {
        self.interactor = interactor
        self.interactor.setUp(delegate: self)
    }

    func viewWillAppear() {
        self.interactor.getDrinks()
    }
    
    func setUp(delegate: FavoritePresenterDelegate) {
        self.delegate = delegate
    }
}

extension FavoritePresenter: FavoriteInteractorDelegate {
    
    func didGetDrinks(drinks: [String : Drink]) {
        self.delegate?.showDrinks(drinks: drinks)
    }
}
