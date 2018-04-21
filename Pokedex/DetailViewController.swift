//
//  DetailViewController.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    
    var pokeData = PokeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokeData.name
        
        pokeData.getPokemon {
            self.updateUserInterface()
        }
        
    }

    func updateUserInterface() {
        self.heightLabel.text = "\(self.pokeData.height)"
        self.weightLabel.text = "\(self.pokeData.weight)"
        
        
        
        // code for reading in a url and displaying in an image
        guard let imageURL = URL(string: pokeData.imageURL) else { return }
        do {
            let data = try Data(contentsOf: imageURL)
            pokemonImage.image = UIImage(data: data)
        } catch {
            print("**** ERROR: error thrown trying to get data from URL \(imageURL)")
        }
    }
    
}
