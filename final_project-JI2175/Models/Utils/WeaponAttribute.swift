//
//  WeaponAttribute.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation

struct WeaponAttribute: Codable {
    var attributeType: WeaponAttributeType
    var attributeValue: Int
    
    enum CodingKeys: String, CodingKey {
        case attributeType = "attribute_type"
        case attributeValue = "attribute_value"
    }
}
