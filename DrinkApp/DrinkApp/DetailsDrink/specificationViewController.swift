//
//  specificationViewController.swift
//  DrinkApp
//
//  Created by Wellington on 10/03/22.
//

import UIKit

class specificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableTwo: UITableView!
    
    var drink: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableTwo.dataSource = self
        self.tableTwo.delegate = self
        
        self.title = drink?.strDrink
        self.title = title?.uppercased()
        
        let nib = UINib(nibName: "imageTableViewCell", bundle: nil)
        self.tableTwo.register(nib, forCellReuseIdentifier:"imageTableViewCell")
        
        let nib_2 = UINib(nibName: "nameDrinkTableViewCell", bundle: nil)
        self.tableTwo.register(nib_2, forCellReuseIdentifier:"nameDrinkTableViewCell")
        
        let nib_3 = UINib(nibName: "ingredientsTableViewCell", bundle: nil)
        self.tableTwo.register(nib_3, forCellReuseIdentifier:"ingredientsTableViewCell")
        
        let nib_4 = UINib(nibName: "howToDoTableViewCell", bundle: nil)
        self.tableTwo.register(nib_4, forCellReuseIdentifier:"howToDoTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageTableViewCell") as? imageTableViewCell else {
                return UITableViewCell()
            }
            cell.setup_image(image: drink?.strDrinkThumb ?? "")
            return cell

        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameDrinkTableViewCell") as? nameDrinkTableViewCell else {
                return UITableViewCell()
            }

            cell.setup_name(name: drink?.strDrink ?? "")
            return cell

            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsTableViewCell") as? ingredientsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup_ingredients(ingredient1: drink?.strIngredient1 ?? "", ingredient2: drink?.strIngredient2 ?? "", ingredient3: drink?.strIngredient3 ?? "", ingredient4: drink?.strIngredient4 ?? "", ingredient5: drink?.strIngredient5 ?? "", ingredient6: drink?.strIngredient6 ?? "", measure1: drink?.strMeasure1 ?? "", measure2: drink?.strMeasure2 ?? "", measure3: drink?.strMeasure3 ?? "", measure4: drink?.strMeasure4 ?? "", measure5: drink?.strMeasure5 ?? "", measure6: drink?.strMeasure6 ?? "")
            return cell

        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "howToDoTableViewCell") as? howToDoTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup_howDO(howDo: drink?.strInstructions ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 390
        }
        else {
            return UITableView.automaticDimension
        }
    }
}
