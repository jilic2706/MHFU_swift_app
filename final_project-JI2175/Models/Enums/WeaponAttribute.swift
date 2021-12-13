//
//  File.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum WeaponAttribute: Int, CustomStringConvertible, Codable {
    case fire = 1
    case water = 2
    case thunder = 3
    case ice = 4
    case dragon = 5
    case poison = 6
    case sleep = 7
    case paralysis = 8
    
    var description: String {
        switch self {
        case .fire:
            return "Fire"
        case .water:
            return "Water"
        case .thunder:
            return "Thunder"
        case .ice:
            return "Ice"
        case .dragon:
            return "Dragon"
        case .poison:
            return "Poison"
        case .sleep:
            return "Sleep"
        case .paralysis:
            return "Paralysis"
        }
    }
}
