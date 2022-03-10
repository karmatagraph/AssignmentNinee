//
//  Pokemon.swift
//  AssignmentNinee
//
//  Created by karma on 3/10/22.
//

import Foundation
struct Pokemon: Codable{
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let imageURL: URL?
    // coding keys to get nested values
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case height = "height"
        case weight = "weight"
        case imageURL = "front_default"
    }
    
}
