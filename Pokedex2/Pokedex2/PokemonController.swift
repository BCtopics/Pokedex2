//
//  PokemonController.swift
//  Pokedex2
//
//  Created by Bradley GIlmore on 6/6/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class PokemonController {
    
/*
- Make and send network request
- Wait for response as Data
- Serialize data as json
- Get card dictionaries
- Turn those dictionaries into Card objects
- Return the cards.
*/
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon")

    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        let searchURL = baseURL?.appendingPathComponent(searchTerm.lowercased())
        guard let url = searchURL else { completion(nil); return }
        
        NetworkController.performRequest(for: url, httpMethod: .get, urlParameters: nil, body: nil) { (data, error) in
            
            if let error = error {
                NSLog("Error performing fetchRequest to API. \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                NSLog("JSON Serialization failed.")
                completion(nil)
                return
            }
           
            guard let pokemon = Pokemon(dictionary: jsonDictionary) else { completion(nil); return }
    
            ImageController.image(forURL: pokemon.spriteEndpoint, completion: { (image) in
                pokemon.image = image
                completion(pokemon)
            })
        }
    }
}
