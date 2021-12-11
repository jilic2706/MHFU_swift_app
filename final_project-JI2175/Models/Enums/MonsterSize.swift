//
//  MonsterSize.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum MonsterSize: Int, CustomStringConvertible, Codable {
    case small = 1
    case large = 2
    
    var description: String {
        switch self {
        case .small:
            return "Small"
        case .large:
            return "Large"
        }
    }
}
