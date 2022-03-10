//
//  PokemonViewCell.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import UIKit

class PokemonViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func setName(poke: PokeList){
        nameLbl.text = poke.name
    }
}
