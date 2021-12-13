//
//  ArmorPieceType.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum ArmorPieceType: Int, CustomStringConvertible, Codable {
    case head = 1
    case torso = 2
    case arms = 3
    case waist = 4
    case feet = 5
    
    var description: String {
        switch self {
        case .head:
            return "helm"
        case .torso:
            return "chest"
        case .arms:
            return "arms"
        case .waist:
            return "waist"
        case .feet:
            return "legs"
        }
    }
}
