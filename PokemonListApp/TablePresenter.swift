//
//  TablePresenter.swift
//  PokemonListApp
//
//  Created by user154783 on 13/10/2019.
//  Copyright © 2019 user154783. All rights reserved.
//
import Foundation
import UIKit

protocol TablePresenterDelegate {
    func reload()
}
class TablePresenter: NSObject {
    
    var pokemonArray : [Pokemon] = []
    
    var delegate: TablePresenterDelegate? {
        didSet{
            let model = Model()
             model.loadData { (list) in
                 self.pokemonArray = list
                 self.delegate?.reload()
             }
        }
    }
    
    func getPokemon(row: Int) -> Pokemon {
        return pokemonArray[row]
    }
    
    func getPokemonListCount() -> Int {
        return pokemonArray.count
    }
    
    func sortNumber() {
        pokemonArray.sort(by:{ $0.number < $1.number })
        delegate?.reload()
    }
    
    func soretName() {
        pokemonArray.sort(by: { $0.name < $1.name })
        delegate?.reload()
    }
    
    
}
