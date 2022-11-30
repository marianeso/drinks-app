//
//  ProfileViewController.swift
//  DrinkApp
//
//  Created by Wellington Bezerra on 4/6/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var infoProfileTable: UITableView!
    //   @IBOutlet weak var clientCodeLabel: UILabel!
    
    private let profileStorage = ProfileStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupProfileImageView()
        
        self.infoProfileTable.dataSource = self
        self.infoProfileTable.delegate = self
        
        let nib = UINib(nibName: "infoProfileTableViewCell", bundle: nil)
        self.infoProfileTable.register(nib, forCellReuseIdentifier:"infoProfileTableViewCell")
        
//        self.setupClientCodeLabel()
        
//        // apresenta informação salva
//        let text = self.profileStorage.retrive() ?? "Código do cliente"
//        self.clientCodeLabel.text = text
    }
}

extension ProfileViewController {
    
    // Profile Image View
    
    private func setupProfileImageView() {
        // gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))) //dar acao a imagem
        profileImageView.addGestureRecognizer(tap)
        profileImageView.isUserInteractionEnabled = true
        
        //Layout da imagem
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.borderWidth = 3.0
        self.profileImageView.layer.borderColor = UIColor.black.cgColor
                
        let url = URL(string: "https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Noma-2.jpg") //url com a imagem
        self.profileImageView.sd_setImage(with: url) //colocar a imagem com o POD
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.showAlertWithThreeButton() //acao ao clicar no botao
    }
    
    func showAlertWithThreeButton() {
        let alert = UIAlertController(title: "Selecione uma imagem", message: "De onde você quer escolher esta imagem?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Usar câmera", style: .default, handler: { (_) in
            self.getImage(fromSourceType: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Galeria de Fotos", style: .default, handler: { (_) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController() // classe responsável pela escolha de foto do usuário
            imagePickerController.delegate = self // a classe ProfileViewController passa a escutar a UIImagePickerController
            imagePickerController.sourceType = sourceType //escolher o tipo de tela: camera ou galeria
            self.present(imagePickerController, animated: true, completion: nil) // forma q a tela é apresetada
        }
    }
}
    
//    // Client Code Label
//
//    func setupClientCodeLabel() {
//        // Código do cliente
//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap2(_:)))
//        clientCodeLabel.addGestureRecognizer(tap2)
//        clientCodeLabel.isUserInteractionEnabled = true
//    }
//
//    @objc func handleTap2(_ sender: UITapGestureRecognizer) {
//        //1. Create the alert controller.
//        let alert = UIAlertController(title: "Código", message: "Digite seu código", preferredStyle: .alert)
//
//        //2. Add the text field. You can configure it however you need.
//        alert.addTextField { (textField) in
//            textField.text = ""
//        }
//
//        // 3. Grab the value from the text field, and print it when the user clicks OK.
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            guard let textField = alert?.textFields?.first else { return }
//
//            let text = textField.text ?? ""
//
//            self.clientCodeLabel.text = text
//            self.profileStorage.save(value: text)
//        }))
//
//        // 4. Present the alert.
//        self.present(alert, animated: true, completion: nil)
//    }
//}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //imagePickerController:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // didFinishPickingMediaWithInfo devolvendo a foto que foi selecionada.
        // Dismiss - fecha a tela dps de escolher/bater a foto. Completion: Retorno. Avisar algo aconteceu, nesse caso, a tela ja foi fechada.
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.profileImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
 
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoProfileTableViewCell", for: indexPath) as? infoProfileTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
        cell.title.text = "Dados Cadastrais"
        cell.info.text = ""
            
        case 1:
        cell.title.text = "Telefone"
        cell.info.text = "(21) 9 9435-7970"
            
        case 2:
        cell.title.text = "Cidade"
        cell.info.text = "Copacabana - RJ"

        case 3:
        cell.title.text = "Endereço"
        cell.info.text = "Rua Barata Ribeiro"
            
        case 4:
        cell.title.text = "Código"
        cell.info.text = "Código do Cliente"
        
        
        default:
        cell.title.text = "Sair"
        cell.info.text = ""
            
        // gesture
        let tap_2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTapLogOff(_:))) //dar acao a imagem
        cell.addGestureRecognizer(tap_2)
        cell.isUserInteractionEnabled = true
        }
            
        return cell
    }
    
    @objc func handleTapLogOff(_ sender: UITapGestureRecognizer) {
        
        // acessa a sceneDelegate do projeto
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
        
        // troca root do projeto
        sceneDelegate.window?.rootViewController = LoginViewController()
        sceneDelegate.window?.makeKeyAndVisible()
    }
}

