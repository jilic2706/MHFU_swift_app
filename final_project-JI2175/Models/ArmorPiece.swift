//
//  ArmorPiece.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

struct ArmorPiece: Codable {
    var name: String
    var description: String
    var type: ArmorPieceType
    var physicalDefense: Int
    var fireDefense: Int
    var waterDefense: Int
    var thunderDefense: Int
    var iceDefense: Int
    var dragonDefense: Int
    var slots: Int
    var skillPoints: [SkillPoint]
    //var craftingMaterials: [Material]
    var craftingCost: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case type = "armor_type"
        case physicalDefense = "physical_defense"
        case fireDefense = "fire_defense"
        case waterDefense = "water_defense"
        case thunderDefense = "thunder_defense"
        case iceDefense = "ice_defense"
        case dragonDefense = "dragon_defense"
        case slots
        case skillPoints = "skill_points"
        //case craftingMaterials = "crafting_materials"
        case craftingCost = "crafting_cost"
    }
}
