//
//  Drink.swift
//  DrinkApp
//
//  Created by Wellington on 08/03/22.
//

import Foundation

struct Drink : Codable {
    let idDrink : String?
    let strDrink : String?
    let strInstructions : String?
    let strDrinkThumb : String?
    let strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?

    enum CodingKeys: String, CodingKey {

        case idDrink = "idDrink"
        case strDrink = "strDrink"
        case strInstructions = "strInstructions"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
    }
}
