//
//  ingredientsTableViewCell.swift
//  DrinkApp
//
//  Created by Wellington Bezerra on 3/10/22.
//

import UIKit

class ingredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredient1: UILabel!
    
    @IBOutlet weak var ingredient2: UILabel!
    
    @IBOutlet weak var ingredient3: UILabel!
    
    @IBOutlet weak var ingredient4: UILabel!
    
    @IBOutlet weak var ingredient5: UILabel!
    
    @IBOutlet weak var ingredient6: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup_ingredients(ingredient1: String, ingredient2: String,ingredient3: String,ingredient4: String,ingredient5: String,ingredient6: String, measure1: String, measure2: String,measure3: String,measure4: String,measure5: String,measure6: String) {
        let ingred1 = ingredient1
        let ingred2 = ingredient2
        let ingred3 = ingredient3
        let ingred4 = ingredient4
        let ingred5 = ingredient5
        let ingred6 = ingredient6
        let measure1 = measure1
        let measure2 = measure2
        let measure3 = measure3
        let measure4 = measure4
        let measure5 = measure5
        let measure6 = measure6
        
        self.ingredient1.text = measure1 + ingred1
        self.ingredient2.text = measure2 + ingred2
        self.ingredient3.text = measure3 + ingred3
        self.ingredient4.text = measure4 + ingred4
        self.ingredient5.text = measure5 + ingred5
        self.ingredient6.text = measure6 + ingred6
    }
    
}
