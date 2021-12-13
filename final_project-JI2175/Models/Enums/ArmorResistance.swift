//
//  ArmorResistance.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import Foundation

enum ArmorResistance: Int, CustomStringConvertible, Codable, CaseIterable {
    case fire = 1
    case water = 2
    case thunder = 3
    case ice = 4
    case dragon = 5
    
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
        }
    }
}
