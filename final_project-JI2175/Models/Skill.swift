//
//  Skill.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Skill: Entity {
    var thresholds: [[SkillEffect]]
    
    enum CodingKeys: String, CodingKey {
        case thresholds
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        thresholds = try values.decode([[SkillEffect]].self, forKey: .thresholds)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, thresholds: [[SkillEffect]]) {
        self.thresholds = thresholds
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
