//
//  ContentView.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemonList, id: \.name) { pokemon in
                NavigationLink(destination: PokemonDetailView(url: pokemon.url)) {
                    Text(pokemon.name.capitalized)
                }
            }
            .navigationBarTitle("Pokédex")
            .onAppear {
                viewModel.fetchPokemonList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


