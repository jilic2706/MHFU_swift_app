//
//  Skill.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Skill: Entity {
    var activationThresholds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case activationThresholds = "activation_threshold"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activationThresholds = try values.decode([Int].self, forKey: .activationThresholds)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, activationThresholds: [Int]) {
        self.activationThresholds = activationThresholds
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
