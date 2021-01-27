////  Created by Victor Hernandez.
//  Copyright © 2020 Victor Hernandez. All rights reserved.
//  Contact victoralfonso920@gmail.com

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon:Pokemon
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 90, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.trailing,.bottom],8)
                       
                }
            }
        }
        .background(Color(pokemon.type.getColorForType()))
        .cornerRadius(12)
        .shadow(color: Color(pokemon.type.getColorForType()), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[3])
    }
}
