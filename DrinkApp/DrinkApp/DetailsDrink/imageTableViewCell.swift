//
//  imageTableViewCell.swift
//  DrinkApp
//
//  Created by Wellington Bezerra on 3/10/22.
//

import UIKit

class imageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageDrink: UIImageView!
    
    override func awakeFromNib() {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup_image(image: String) {
        let url = URL(string: image)
        imageDrink.sd_setImage(with: url)
    }
}
