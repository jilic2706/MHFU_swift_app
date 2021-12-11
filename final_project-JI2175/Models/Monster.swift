//
//  Monster.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Monster: Entity {
    var type: MonsterType
    var size: MonsterSize
    var icon: URL?
    var habitats: [Int]
    
    enum CodingKeys: String, CodingKey {
        case type = "monster_type"
        case size = "monster_size"
        case icon
        case habitats
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(MonsterType.self, forKey: .type)
        size = try values.decode(MonsterSize.self, forKey: .size)
        icon = try values.decode(URL.self, forKey: .icon)
        habitats = try values.decode([Int].self, forKey: .habitats)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, type: MonsterType, size: MonsterSize, icon: URL?, habitats: [Int]) {
        self.type = type
        self.size = size
        self.icon = icon
        self.habitats = habitats
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
