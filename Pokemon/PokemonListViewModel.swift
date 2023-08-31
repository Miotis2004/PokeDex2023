//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: [PokemonListItem] = []
    
    func fetchPokemonList() {
        PokeAPI.shared.fetchPokemonList { [weak self] list in
            if let list = list {
                DispatchQueue.main.async {
                    self?.pokemonList = list
                }
            }
        }
    }
}
