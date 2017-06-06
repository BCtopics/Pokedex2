//
//  PokemonSearchViewController.swift
//  Pokedex2
//
//  Created by Bradley GIlmore on 6/6/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: - UISearchBarDelegate Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let search = searchBar.text else { return }
        PokemonController.fetchPokemon(for: search) { (pokemon) in
            guard let pokemon = pokemon else { return }
        
            DispatchQueue.main.async {
                self.updateWith(pokemon: pokemon)
            }
            
        }
        
    }

    func updateWith(pokemon: Pokemon) {
        imageView.image = pokemon.image
        nameLabel.text = "Name: \(pokemon.name)"
        idLabel.text = "ID: \(pokemon.id)"
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
}
