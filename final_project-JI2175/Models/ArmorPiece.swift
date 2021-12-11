//
//  ArmorPiece.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class ArmorPiece: Entity {
    var physicalDefense: Int
    var fireDefense: Int
    var waterDefense: Int
    var thunderDefense: Int
    var iceDefense: Int
    var dragonDefense: Int
    var slots: Int
    var skillPoints: [SkillPoint]
    var craftingMaterials: [Material]
    var craftingCost: Int
    
    enum CodingKeys: String, CodingKey {
        case physicalDefense = "physical_defense"
        case fireDefense = "fire_defense"
        case waterDefense = "water_defense"
        case thunderDefense = "thunder_defense"
        case iceDefense = "ice_defense"
        case dragonDefense = "dragon_defense"
        case slots
        case skillPoints = "skill_points"
        case craftingMaterials = "crafting_materials"
        case craftingCost = "crafting_cost"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        physicalDefense = try values.decode(Int.self, forKey: .physicalDefense)
        fireDefense = try values.decode(Int.self, forKey: .fireDefense)
        waterDefense = try values.decode(Int.self, forKey: .waterDefense)
        thunderDefense = try values.decode(Int.self, forKey: .thunderDefense)
        iceDefense = try values.decode(Int.self, forKey: .iceDefense)
        dragonDefense = try values.decode(Int.self, forKey: .dragonDefense)
        slots = try values.decode(Int.self, forKey: .slots)
        skillPoints = try values.decode([SkillPoint].self, forKey: .skillPoints)
        craftingMaterials = try values.decode([Material].self, forKey: .craftingMaterials)
        craftingCost = try values.decode(Int.self, forKey: .craftingCost)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, physicalDefense: Int, fireDefense: Int, waterDefense: Int, thunderDefense: Int, iceDefense: Int, dragonDefense: Int, slots: Int, skillPoints: [SkillPoint], craftingMaterials: [Material], craftingCost: Int) {
        self.physicalDefense = physicalDefense
        self.fireDefense = fireDefense
        self.waterDefense = waterDefense
        self.thunderDefense = thunderDefense
        self.iceDefense = iceDefense
        self.dragonDefense = dragonDefense
        self.slots = slots
        self.skillPoints = skillPoints
        self.craftingMaterials = craftingMaterials
        self.craftingCost = craftingCost
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
