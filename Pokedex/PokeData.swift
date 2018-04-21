//
//  PokeData.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PokeData {
    var name = ""
    var weight = 0.0
    var height = 0.0
    var imageURL = ""
    var url = ""
    
    func getPokemon(completed: @escaping () -> ()) {
        Alamofire.request(self.url).responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.height = json["height"].doubleValue
                self.weight = json["weight"].doubleValue
                self.imageURL = json["sprites"]["front_default"].stringValue
            case .failure(let error):
                print("*** ERROR: failed to get data from url \(self.url) \(error.localizedDescription)")
            }
            completed()
        }
    }
}
