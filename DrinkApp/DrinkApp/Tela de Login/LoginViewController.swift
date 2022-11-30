//
//  LoginViewController.swift
//  DrinkApp
//
//  Created by Wellington on 27/05/22.
//

import UIKit
import SDWebImage


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var LoginImage: UIImageView!
    @IBOutlet weak var LoginName: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LoginButton.layer.cornerRadius = 10
        self.LoginButton.layer.borderWidth = 3.0
        self.LoginButton.layer.borderColor = UIColor.gray.cgColor
        self.LoginButton.layer.backgroundColor = UIColor.gray.cgColor
        
        let url = URL(string: "https://www.verywellfamily.com/thmb/W21BtQuzVI9cT4GNd8ULwc4xOdM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc()/can-i-drink-wine-while-breastfeeding-5195406_final_w_logo-3b55fc5cab6941618af6f729c0eb23fa.png")
        LoginImage.sd_setImage(with: url)
    }

    @IBAction func LoginButton(_ sender: Any) {
        
        // acessa a sceneDelegate do projeto
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}

        // troca root do projeto
        sceneDelegate.window?.rootViewController = TabBarController()
        sceneDelegate.window?.makeKeyAndVisible()
        
//        let user = LoginName.text
//        let password = LoginPassword.text
        
//        if user == "admin" && password == "admin" {
//            print ("senha correta")
//
//            // acessa a sceneDelegate do projeto
//            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
//
//            // troca root do projeto
//            sceneDelegate.window?.rootViewController = TabBarController()
//            sceneDelegate.window?.makeKeyAndVisible()
//
//        } else {
//            print ("senha incorreta")
//        }
    }
}
