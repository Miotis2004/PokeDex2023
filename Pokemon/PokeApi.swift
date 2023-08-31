//
//  PokeApi.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

import Foundation

class PokeAPI {
    static let shared = PokeAPI()
    private init() {}

    private let baseURL = "https://pokeapi.co/api/v2/"

    func fetchPokemonList(completion: @escaping ([PokemonListItem]?) -> Void) {
        guard let url = URL(string: baseURL + "pokemon?limit=20") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(PokemonListResponse.self, from: data)
                completion(response.results)
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func fetchPokemonDetails(for url: String, completion: @escaping (PokemonDetail?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            do {
                let pokemonDetail = try decoder.decode(PokemonDetail.self, from: data)
                completion(pokemonDetail)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

