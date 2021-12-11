//
//  SkillEffect.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import Foundation

struct SkillEffect: Codable, Hashable {
    var effectName: String
    var reqSkillPoints: Int
    
    enum CodingKeys: String, CodingKey {
        case effectName = "effect_name"
        case reqSkillPoints = "req_skill_points"
    }
}
