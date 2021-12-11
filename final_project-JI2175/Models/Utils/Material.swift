//
//  Material.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

struct Material: Codable {
    var itemId: Int
    var itemQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case itemId = "item_id"
        case itemQuantity = "item_quantity"
    }
}
