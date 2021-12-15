//
//  Sharpness.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation

struct Sharpness: Codable, Hashable {
    var sharpnessType: SharpnessType
    var sharpnessValue: SharpnessLength
    
    enum CodingKeys: String, CodingKey {
        case sharpnessType = "sharpness_type"
        case sharpnessValue = "sharpness_value"
    }
}
