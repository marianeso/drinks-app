//
//  FavoriteDrinkCollectionViewCell.swift
//  DrinkApp
//
//  Created by Wellington on 19/10/22.
//

import UIKit
import SDWebImage


class FavoriteDrinkCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageDrink: UIImageView!
    @IBOutlet weak var nameDrink: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup_FavoriteDrink(nameDrink: String, imageURL: String) {
        self.nameDrink.text = nameDrink
        let url = URL(string: imageURL)
        imageDrink.sd_setImage(with: url)
        imageDrink.layer.cornerRadius = 10
    }

}
