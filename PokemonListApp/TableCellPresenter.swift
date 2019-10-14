//
//  TableCellPresenter.swift
//  PokemonListApp
//
//  Created by user154783 on 13/10/2019.
//  Copyright © 2019 user154783. All rights reserved.
//
import Foundation
import UIKit

protocol TableCellProtocol {
    func setValues()
}

class TableCellPresenter: NSObject {
    
    var delegate : TableCellProtocol?
    var pokemon : Pokemon! {
        didSet{
            delegate?.setValues()
        }
    }
 
    func getPokemonNumber() -> String {
        return String(pokemon.number)
    }
    
        func getPokemonName() -> String {
            return pokemon.name.uppercased()
    }
    
    func getPokemonImage() -> UIImage {
        return pokemon.image
    }
}
