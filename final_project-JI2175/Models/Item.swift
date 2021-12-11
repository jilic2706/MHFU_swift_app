//
//  Item.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Item: Entity {
    var icon: URL?
    var rarity: Int
    var purchaseCost: Int?
    
    enum CodingKeys: String, CodingKey {
        case icon
        case rarity
        case purchaseCost = "purchase_cost"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try values.decode(URL.self, forKey: .icon)
        rarity = try values.decode(Int.self, forKey: .rarity)
        purchaseCost = try values.decode(Int.self, forKey: .purchaseCost)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, icon: URL?, rarity: Int, purchaseCost: Int?) {
        self.icon = icon
        self.rarity = rarity
        self.purchaseCost = purchaseCost
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
