//
//  Product1TableViewCell.swift
//  DrinkApp
//
//  Created by Wellington on 10/03/22.
//

import UIKit
import SDWebImage


// Criação do delegate
protocol FavoriteButtonManagerDelegate: AnyObject {
    func didClickFavoriteButton(drinkID: String, isFavorite:Bool) //funcao para fazer a chamada da requisicao
}

class Product1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var backColor: UIView!
    @IBOutlet weak var imageDrink: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    
    var drinkID: String = ""
    
    var isFavorite: Bool = false
    
    // variável do delegate
    weak var delegate: FavoriteButtonManagerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupTapGesture()
        
        self.backColor.layer.cornerRadius = 10
        
        self.selectionStyle = .none
    }
    
    
    // MARK: - Controle do estado do botão favoritar
    
    func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        favoriteImageView.addGestureRecognizer(tap)
        favoriteImageView.isUserInteractionEnabled = true
    }
    

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        isFavorite = !isFavorite
        self.setupFavoriteImageView()
        //avisar para a classe que esta esperando o dado que ele chegou
        self.delegate?.didClickFavoriteButton(drinkID: self.drinkID, isFavorite: self.isFavorite)
    }
    
    // UIImage(named: "nome_da_estrela") - "nome_da_estrela precisa ser uma imagem dentro da pasta Assets"
    // UIImage(systemName: "nome_da_estrela") - "nome_da_estrela já está presente a partir do iOS 13
    func setupFavoriteImageView() {

        if isFavorite == false {
            favoriteImageView.image = UIImage(systemName: "star")
        } else {
            favoriteImageView.image = UIImage(systemName: "star.fill")
        }
    }
    

    // MARK: - Utilizado na HomeViewController

    func setup(drink: Drink, isFavorite: Bool) {
        self.drinkID = drink.idDrink ?? ""
        
        self.productName.text = drink.strDrink
        let url = URL(string: drink.strDrinkThumb ?? "")
        imageDrink.sd_setImage(with: url)
        
        self.imageDrink.layer.cornerRadius = 15
        
        self.isFavorite = isFavorite
        self.setupFavoriteImageView()
    }
}
