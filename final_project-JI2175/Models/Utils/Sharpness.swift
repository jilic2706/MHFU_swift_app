//
//  Sharpness.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation

struct Sharpness: Codable, Hashable {
    var sharpnessLevel: SharpnessLevel
    var sharpnessValue: Int
    
    enum CodingKeys: String, CodingKey {
        case sharpnessLevel = "sharpness_level"
        case sharpnessValue = "sharpness_value"
    }
}
