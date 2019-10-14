//
//  TableViewController.swift
//  PokemonListApp
//
//  Created by user154783 on 13/10/2019.
//  Copyright © 2019 user154783. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, TablePresenterDelegate {

    var presenter = TablePresenter()
    
  //  override func init
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        
    }
    
    func reload(){
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func sortList(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sort", message: "Sorting options", preferredStyle: .alert)
        let numberSortAction = UIAlertAction(title: "Number", style: .default) { (action) in
            self.presenter.sortNumber()
        }
        let nameSortAction = UIAlertAction(title: "Name", style: .default) { (action) in
            self.presenter.soretName()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        alert.addAction(numberSortAction)
        alert.addAction(nameSortAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getPokemonListCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        cell.presenter.pokemon = presenter.getPokemon(row: indexPath.row)
        
        return cell
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
