//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Ronald Joubert on 8/30/23.
//

struct PokemonListItem: Codable {
    let name: String
    let url: String
}

struct PokemonListResponse: Codable {
    let results: [PokemonListItem]
}

struct PokemonDetail: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

