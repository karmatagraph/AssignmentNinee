//
//  Pokemon.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import Foundation
struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let imageURL: String
    // coding keys to get nested values
    enum CodingKeys: CodingKey {
        case id, name, height, weight, sprites
    }
        
    enum ImageKeys: String, CodingKey {
        case imageUrl = "front_default"
    }
        
            init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
            name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
            height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
            weight = try container.decodeIfPresent(Int.self, forKey: .weight) ?? 0
            
            let sprites = try container.nestedContainer(keyedBy: ImageKeys.self, forKey: .sprites)
            imageURL = try sprites.decode(String.self, forKey: .imageUrl)
        }
}
