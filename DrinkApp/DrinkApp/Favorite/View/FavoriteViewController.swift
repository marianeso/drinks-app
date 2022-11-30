//
//  FavoriteViewController.swift
//  DrinkApp
//
//  Created by Wellington on 21/05/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteDrinkCollection: UICollectionView!
    
    
    private let drinkStorage = DrinkStorage()
    private var drinks: [Drink] = []
    var presenter: FavoritePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoriteDrinkCollection.dataSource = self
        self.favoriteDrinkCollection.delegate = self
        
        favoriteDrinkCollection.registerNib(FavoriteDrinkCollectionViewCell.self)

        self.navigationItem.title = "FAVORITE DRINKS"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
    
    func setUp(presenter: FavoritePresenterProtocol) {
        self.presenter = presenter
    }
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteDrinkCollectionViewCell", for: indexPath) as? FavoriteDrinkCollectionViewCell else  {
            return UICollectionViewCell()
        }

        let drink = self.drinks[indexPath.row]
        cell.setup_FavoriteDrink(nameDrink: drink.strDrink ?? "", imageURL: drink.strDrinkThumb ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let telaDois = specificationViewController()
            telaDois.drink = self.drinks[indexPath.row]
            self.navigationController?.pushViewController(telaDois, animated: true)

    }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = self.favoriteDrinkCollection.frame.width - 2*10
        let drinkWidth = collectionWidth/3
        return CGSize(width: drinkWidth, height: 185)
    }
}

extension FavoriteViewController: FavoritePresenterDelegate {
    
    func showDrinks(drinks: [String : Drink]) {
        let drinksNotOrdered = drinks.compactMap({ $0.value })
        self.drinks = drinksNotOrdered.sorted(by: { $0.strDrink ?? "" < $1.strDrink ?? "" })
        self.favoriteDrinkCollection.reloadData()
    }
}

