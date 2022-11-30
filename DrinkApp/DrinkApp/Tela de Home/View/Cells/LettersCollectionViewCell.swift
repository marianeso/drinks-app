//
//  LettersCollectionViewCell.swift
//  DrinkApp
//
//  Created by Wellington on 23/10/22.
//

import UIKit

class LettersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var caracter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(caracter: String) {
        self.caracter.text = caracter
    }
}
