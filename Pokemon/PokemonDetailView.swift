//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject private var viewModel: PokemonDetailViewModel

    init(url: String) {
        viewModel = PokemonDetailViewModel(url: url)
    }

    var body: some View {
        if let pokemonDetail = viewModel.pokemonDetail {
            VStack {
                Text(pokemonDetail.name.capitalized)
                    .font(.title)
                Text("Height: \(pokemonDetail.height)")
                Text("Weight: \(pokemonDetail.weight)")
                if let spriteURL = URL(string: pokemonDetail.sprites.frontDefault) {
                    AsyncImage(url: spriteURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}

