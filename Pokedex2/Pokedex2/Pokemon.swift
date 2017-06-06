//
//  Pokemon.swift
//  Pokedex2
//
//  Created by Bradley GIlmore on 6/6/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import UIKit

class Pokemon {
    
    //MARK: - Keys
    
    private let nameKey = "name"
    private let idKey = "id"
    private let spritesKey = "sprites"
    private let spriteImageEndpoint = "front_default"
    
    //MARK: - Internal Properties
    
    let name: String
    let id: Int
    let spriteEndpoint: String
    var image: UIImage?
    
    //MARK: - Initializers
    
    init?(dictionary: [String: Any]) {
        
        guard let name = dictionary[nameKey] as? String,
            let id = dictionary[idKey] as? Int,
            let spritesDictionary = dictionary[spritesKey] as? [String: Any],
            let spriteImageEndpoint = spritesDictionary[spriteImageEndpoint] as? String
        else { return nil }
        
        self.name = name
        self.id = id
        self.spriteEndpoint = spriteImageEndpoint
        
    }
    
}
