//
//  HomeViewController.swift
//  DrinkApp
//
//  Created by Wellington on 07/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableOne: UITableView!
    
    @IBOutlet weak var letterCollection: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var drinkID: String = ""
    var drinks: [Drink] = []  //criando uma variavel do tipo Drinks
    var letters: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","Y","Z"]

    let drinkManager = DrinkManager ()  // colocando a classe dentro da variavel
    let drinkStorage = DrinkStorage()
    
    let presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.delegate = self
        
        
        self.setupTableView()
        self.setupSearchBar()
        self.setupCollectionView()
        
        self.activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presenter.viewDdidLoad()
    }
    
    private func setupSearchBar() {
        let searchBar = UISearchBar() //cria
        searchBar.backgroundColor = .white //customiza
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder = "Digite o nome do drink" //texto que vc vai ver por atras
        
        searchBar.delegate = self //conexao das funcoes do protocolo com o componente search bar, a tela escuta a search bar.
        
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
//        self.navigationController?.hidesBarsOnSwipe = true //quando scrolla a tela, esconde a search bar
    }
    
    private func setupTableView() {
        self.tableOne.dataSource = self //conecta a tabela da Xib com as funcoes da classe. Funcoes de input
        self.tableOne.delegate = self //conecta a tabela da Xib com as funcoes da classe. Funcoes de output
        
        let nib = UINib(nibName: "Product1TableViewCell", bundle: nil)
        self.tableOne.register(nib, forCellReuseIdentifier:"Product1TableViewCell")
    }
    
    private func setupCollectionView() {
        self.letterCollection.dataSource = self
        self.letterCollection.delegate = self
        
        letterCollection.registerNib(LettersCollectionViewCell.self)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Product1TableViewCell", for: indexPath) as? Product1TableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        let drink = drinks[indexPath.row]
        
        //acesso ao banco para saber se o drink.id está favoritado ou nao
        let storageDrink:Drink? = self.drinkStorage.getDrink(drinkID: drink.idDrink ?? "")
        let isFavorite = storageDrink != nil ? true : false
        
        cell.setup(drink: drink, isFavorite: isFavorite)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let telaDois = specificationViewController()
        telaDois.drink = self.drinks[indexPath.row]
        
        self.navigationController?.pushViewController(telaDois, animated: true)
    }
}


extension HomeViewController: FavoriteButtonManagerDelegate {
    
    //salva no banco o drink.id com a info de true ou false (favoritado ou nao)
    func didClickFavoriteButton(drinkID: String, isFavorite: Bool) {
        guard let drink = self.drinks.filter({ $0.idDrink ==  drinkID }).first else { return }
        // quando usar a funcao first, devolve um array, nesse caso como é so um drink, pode usar o .first
        
        if isFavorite == true {
            self.drinkStorage.save(drinkID: drinkID, drink: drink)
        } else {
            self.drinkStorage.delete(drinkID: drinkID)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { //nao precisa chamar a funcao pq [e um delegate da searchbar, os delegates sao escutados
        
        self.drinkManager.fetchDrinksWithCompletion(inicialDrinkValue: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + searchText ) { drinks  in
            self.drinks = drinks ?? []
            
            DispatchQueue.main.async {
                self.tableOne.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
   
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LettersCollectionViewCell", for: indexPath) as? LettersCollectionViewCell else  {
            return UICollectionViewCell()
        }

        let letter = self.letters[indexPath.row]
        cell.setup(caracter: letter)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectLetter(letter: self.letters[indexPath.row])
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = self.letterCollection.frame.width
        let drinkWidth = collectionWidth/23
        return CGSize(width: drinkWidth, height: 30)
    }
}

extension HomeViewController: HomePresenterDelegate {
    
    func loadDrinks(drinks: [Drink]) {
        DispatchQueue.main.async {
            self.drinks = drinks
            self.tableOne.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}
