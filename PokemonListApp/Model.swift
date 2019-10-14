//
//  Model.swift
//  PokemonListApp
//
//  Created by user154783 on 13/10/2019.
//  Copyright © 2019 user154783. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon {
    let number: Int
    let name: String
    let image: UIImage
}

class Model: NSObject {
    
    override init() {
        super.init()
    }
    
    func replacingUrlString(urlString: String, number : Int) -> String {
        return urlString.replacingOccurrences(of: "<id>", with: String(number), options: .literal, range: nil)
    }
    
    func loadData(completionHandler: (([Pokemon])-> Void)?) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            guard error == nil else {return}
            
            var pokemonList = [Pokemon]()
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                guard let rootDic = json as? Dictionary<String,Any> else {return}
                guard let resultsArray = rootDic["results"] as? [Dictionary<String,String>] else {return}
                
                var n = 1
                for obj in resultsArray {
                    
                    guard let imageURL = URL(string: self.replacingUrlString(urlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/<id>.png", number: n)) else {return}
                    guard let dataImg = try? Data(contentsOf: imageURL) else {return}
                    guard let image = UIImage(data: dataImg) else {return}
                    
                    guard let name = obj["name"] else {return}
                    let pokemon = Pokemon(number: n, name: name , image: image)
                    
                    pokemonList.append(pokemon)
                    n += 1
                }
            } catch let error {
                print(error)
                return
            }
        completionHandler?(pokemonList)
        }.resume()
    }
    
}



