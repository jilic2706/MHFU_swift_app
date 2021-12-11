//
//  SkillPoint.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

struct SkillPoint: Codable {
    var skillId: Int
    var skillQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case skillId = "skill_id"
        case skillQuantity = "skill_quantity"
    }
}
