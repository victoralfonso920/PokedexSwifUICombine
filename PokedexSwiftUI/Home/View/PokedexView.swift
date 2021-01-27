////  Created by Victor Hernandez.
//  Copyright © 2020 Victor Hernandez. All rights reserved.
//  Contact victoralfonso920@gmail.com

import SwiftUI

struct PokedexView: View {
    
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing:20){
                    ForEach(viewModel.pokemon){ pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
