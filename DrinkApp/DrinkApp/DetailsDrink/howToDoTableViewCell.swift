//
//  howToDoTableViewCell.swift
//  DrinkApp
//
//  Created by Wellington Bezerra on 3/10/22.
//

import UIKit

class howToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var howDo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup_howDO(howDo: String) {
        self.howDo.text = howDo
    }
}
