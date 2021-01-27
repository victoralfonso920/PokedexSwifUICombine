////  Created by Victor Hernandez.
//  Copyright © 2020 Victor Hernandez. All rights reserved.
//  Contact victoralfonso920@gmail.com

import SwiftUI
import Combine

class PokemonViewModel: ObservableObject{
    
    init() {
        getPokemons()
    }
    
    @Published var pokemon = [Pokemon](){
        didSet{
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<PokemonViewModel,Never>()
    
    func getPokemons(){
        Repository().getPokemons { poke in
            self.pokemon = poke
        }
    }
}
