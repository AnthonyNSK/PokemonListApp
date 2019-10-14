//
//  TableViewCell.swift
//  PokemonListApp
//
//  Created by user154783 on 13/10/2019.
//  Copyright © 2019 user154783. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, TableCellProtocol {

    var presenter = TableCellPresenter()
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        presenter.delegate = self
        
    }
     func setValues() {
        numberLabel.text = presenter.getPokemonNumber()
        nameLabel.text = presenter.getPokemonName()
        imgView.image = presenter.getPokemonImage()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
