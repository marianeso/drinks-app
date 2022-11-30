//
//  nameDrinkTableViewCell.swift
//  DrinkApp
//
//  Created by Wellington Bezerra on 3/10/22.
//

import UIKit

class nameDrinkTableViewCell: UITableViewCell {

    @IBOutlet weak var nameDrink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup_name(name: String) {
        self.nameDrink.text = name
    }
}
