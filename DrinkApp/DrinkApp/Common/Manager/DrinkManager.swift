//
//  DrinkManager.swift
//  DrinkApp
//
//  Created by Wellington on 08/03/22.
//

import Foundation

// Criação do delegate
protocol DrinkManagerDelegate: AnyObject {
    func didFetchDrinks(drinks: [Drink]) //funcao para fazer a chamada da requisicao
    func didNotFetchDrinks() //funcao para avisar que um erro ocorreu na requisicao de um dado
}

class DrinkManager {
    
    // completion ---- handler: @escaping ()->Void
    func fetchDrinksWithCompletion(inicialDrinkValue: String, completion: @escaping ([Drink]?)->Void) {
        
        guard let url = URL(string: inicialDrinkValue)  else {
            return
        } //acessar a classe URL para transformar a string em URL e ver se o link é valido, caso nao seja, nao passa pela etapa debaixo.
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 5.0)

        //completion: estou aguardando a resposta do servidor. Funcao para fazer a requisicao para o servidor, pedir um dado.
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //transformacao. DE PARA. DE dados do JSON para o response (classe principal), onde ficara armazenado os dados
            guard let data = data,
                    let response = try? JSONDecoder().decode(Response.self, from: data) else {
                        completion(nil)
                //self.delegate?.didNotFetchDrinks()  //a funcao didnotfetchdrinks faz parte do delegate DrinkManagerDelegate
                return
            }
            
            //avisar para a classe que esta esperando o dado que ele chegou
            completion(response.drinks)
            //self.delegate?.didFetchDrinks(drinks: response.drinks)
        }
        task.resume()
    }



}

enum DrinkManagerError: Error {
    case server
    case parse
    case timeOut
}
