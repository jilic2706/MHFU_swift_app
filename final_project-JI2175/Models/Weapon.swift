//
//  Weapon.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Weapon: Entity {
    var rarity: Int
    var type: WeaponType
    var attack: Int
    var attribute: [WeaponAttribute]?
    var slots: Int
    var defense: Int
    var regSharpness: [Int]
    var spoSharpness: [Int]
    var purchaseCost: Int?
    var craftingMaterials: [Material]?
    var craftingCost: Int?
    var upgradeMaterials: [Material]?
    var upgradeCost: Int?
    var parent: Int?
    var children: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case rarity
        case type
        case attack
        case attribute
        case slots
        case defense
        case regSharpness = "regular_sharpness"
        case spoSharpness = "s+1_sharpness"
        case purchaseCost = "purchase_cost"
        case craftingMaterials = "crafting_materials"
        case craftingCost = "crafting_cost"
        case upgradeMaterials = "upgrade_materials"
        case upgradeCost = "upgrade_cost"
        case parent
        case children
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rarity = try values.decode(Int.self, forKey: .rarity)
        type = try values.decode(WeaponType.self, forKey: .type)
        attack = try values.decode(Int.self, forKey: .attack)
        attribute = try values.decode([WeaponAttribute].self, forKey: .attribute)
        slots = try values.decode(Int.self, forKey: .slots)
        defense = try values.decode(Int.self, forKey: .defense)
        regSharpness = try values.decode([Int].self, forKey: .regSharpness)
        spoSharpness = try values.decode([Int].self, forKey: .spoSharpness)
        purchaseCost = try values.decode(Int.self, forKey: .purchaseCost)
        craftingMaterials = try values.decode([Material].self, forKey: .craftingMaterials)
        craftingCost = try values.decode(Int.self, forKey: .craftingCost)
        upgradeMaterials = try values.decode([Material].self, forKey: .upgradeMaterials)
        upgradeCost = try values.decode(Int.self, forKey: .upgradeCost)
        parent = try values.decode(Int.self, forKey: .parent)
        children = try values.decode([Int].self, forKey: .children)
        try super.init(from: decoder)
    }
}
