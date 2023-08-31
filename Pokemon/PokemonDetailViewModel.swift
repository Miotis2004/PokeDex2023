//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    let url: String

    init(url: String) {
        self.url = url
        fetchPokemonDetail()
    }

    func fetchPokemonDetail() {
        PokeAPI.shared.fetchPokemonDetails(for: url) { [weak self] detail in
            if let detail = detail {
                DispatchQueue.main.async {
                    self?.pokemonDetail = detail
                }
            }
        }
    }
}
