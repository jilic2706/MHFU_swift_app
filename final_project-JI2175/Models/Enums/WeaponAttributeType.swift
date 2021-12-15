//
//  WeaponAttributeType.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation

enum WeaponAttributeType: String, Codable {
    case fire = "fire"
    case water = "water"
    case thunder = "thunder"
    case ice = "ice"
    case dragon = "dragon"
    case poison = "poison"
    case sleep = "sleep"
    case paralysis = "paralysis"
    
    var description: String {
        switch self {
        case .fire: return "Fire"
        case .water: return "Water"
        case .thunder: return "Fire"
        case .ice: return "Ice"
        case .dragon: return "Dragon"
        case .poison: return "Poison"
        case .sleep: return "Sleep"
        case .paralysis: return "Paralysis"
        }
    }
}
