//
//  MenuViewModel.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import Foundation

enum MenuViewModel: Int, CaseIterable {
    case monsters
    case weapons
    case armor
    case quests
    case items
    case location
    
    var iconName: String {
        switch self {
        case .monsters: return "monster"
        case .weapons: return "weapon"
        case .armor: return "armor"
        case .quests: return "quest"
        case .items: return "item"
        case .location: return "location"
        }
    }
    
    var label: String {
        switch self {
        case .monsters: return "Monsters"
        case .weapons: return "Weapons"
        case .armor: return "Armor"
        case .quests: return "Quests"
        case .items: return "Items"
        case .location: return "Locations"
        }
    }
}
