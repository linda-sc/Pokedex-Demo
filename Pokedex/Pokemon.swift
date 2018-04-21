//
//  Pokemon.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    struct PokeReferenceData {
        var name = ""
        var url = ""
    }
    
    var pokeArray: [PokeReferenceData] = []
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemon(completed: @escaping () -> ()) {
        Alamofire.request(pokemonURL).responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numberOfPokemon = json["results"].count
                for index in 0...numberOfPokemon - 1 {
                    let name = json["results"][index]["name"].stringValue
                    let url = json["results"][index]["url"].stringValue
                    self.pokeArray.append(PokeReferenceData(name: name, url: url))
                    print(">>> Data check, \(index) \(name) \(url)")
                }
            case .failure(let error):
                print("*** ERROR: failed to get data from url \(self.pokemonURL) \(error.localizedDescription)")
            }
            completed()
        }
        
    }
}
