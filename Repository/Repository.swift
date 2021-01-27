////  Created by Victor Hernandez.
//  Copyright © 2020 Victor Hernandez. All rights reserved.
//  Contact victoralfonso920@gmail.com

import Foundation

class Repository{
    
    func getPokemons(pokemon: @escaping([Pokemon]) -> ()){
        guard let url = URL(string: Constants.urLlist)else{
        fatalError("The url is not correct")
    }
        URLSession.shared.dataTask(with: url){ dat, responses, error in
            guard let dataPokemon = dat, error == nil, let response = responses as? HTTPURLResponse else{
                return
            }
            if(response.statusCode == 200){
                do{
                    guard let data = dataPokemon.parseData(removeString: "null,") else { return }
                    let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
                    
                    DispatchQueue.main.async {
                        pokemon(pokemons)
                    }
                
                }catch let error{
                    print("an error has ocurred : \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}


