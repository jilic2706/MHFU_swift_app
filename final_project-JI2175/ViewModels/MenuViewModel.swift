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
    case skills
    case decorations
    case location
    case bookmarks
    
    var menuItemIcon: String {
        switch self {
        case .monsters: return "monster"
        case .weapons: return "weapon"
        case .armor: return "armor"
        case .quests: return "quest"
        case .items: return "item"
        case .skills: return "skill"
        case .decorations: return "decoration"
        case .location: return "location"
        case .bookmarks: return "bookmark"
        }
    }
    
    var menuItemText: String {
        switch self {
        case .monsters: return "Monsters"
        case .weapons: return "Weapons"
        case .armor: return "Armor"
        case .quests: return "Quests"
        case .items: return "Items"
        case .skills: return "Skills"
        case .decorations: return "Decoration"
        case .location: return "Locations"
        case .bookmarks: return "Bookmarks"
        }
    }
    
    var menuSelection: Int {
        switch self {
        case .monsters: return 0
        case .weapons: return 1
        case .armor: return 2
        case .quests: return 3
        case .items: return 4
        case .skills: return 5
        case .decorations: return 6
        case .location: return 7
        case .bookmarks: return 8
        }
    }
}
