//
//  MonsterType.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum MonsterType: Int, CustomStringConvertible, Codable {
    case lynian = 1
    case neopteron = 2
    case herbivore = 3
    case birdWyvern = 4
    case flyingWyvern = 5
    case piscineWyvern = 6
    case carapaceon = 7
    case pelagus = 8
    case elderDragon = 9
    
    var description: String {
        switch self {
        case .lynian:
            return "Lynian"
        case .neopteron:
            return "Neopteron"
        case .herbivore:
            return "Herbivore"
        case .birdWyvern:
            return "Bird Wyvern"
        case .flyingWyvern:
            return "Flying Wyvern"
        case .piscineWyvern:
            return "Piscine Wyvern"
        case .carapaceon:
            return "Carapaceon"
        case .pelagus:
            return "Pelagus"
        case .elderDragon:
            return "Elder Dragon"
        }
    }
}
