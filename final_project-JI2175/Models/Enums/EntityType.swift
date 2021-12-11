//
//  EntityType.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum EntityType: Int, CustomStringConvertible, Codable {
    case monster = 1
    case weapon = 2
    case armor = 3
    case quest = 4
    case item = 5
    case skill = 6
    case decoration = 7
    case location = 8
    
    var description: String {
        switch self {
        case .monster:
            return "Monster"
        case .weapon:
            return "Weapon"
        case .armor:
            return "Armor"
        case .quest:
            return "Quest"
        case .item:
            return "Item"
        case .skill:
            return "Skill"
        case .decoration:
            return "Decoration"
        case .location:
            return "Location"
        }
    }
}
