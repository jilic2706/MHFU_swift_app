//
//  Entity.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Entity: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var entityType: EntityType
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case entityType = "entity_type"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        entityType = try values.decode(EntityType.self, forKey: .entityType)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType) {
        self.id = id
        self.name = name
        self.description = description
        self.entityType = entityType
    }
}
