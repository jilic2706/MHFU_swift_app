//
//  WeaponType.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

enum WeaponType: Int, CustomStringConvertible, Codable {
    case greatSword = 1
    case longSword = 2
    case swordAndShield = 3
    case dualBlades = 4
    case hammer = 5
    case huntingHorn = 6
    case lance = 7
    case gunlance = 8
    case lightBowgun = 9
    case heavyBowgun = 10
    case bow = 11
    
    var description: String {
        switch self {
        case .greatSword:
            return "Great Sword"
        case .longSword:
            return "Long Sword"
        case .swordAndShield:
            return "Sword and Shield"
        case .dualBlades:
            return "Dual Blades"
        case .hammer:
            return "Hammer"
        case .huntingHorn:
            return "Hunting Horn"
        case .lance:
            return "Lance"
        case .gunlance:
            return "Gunlance"
        case .lightBowgun:
            return "Light Bowgun"
        case .heavyBowgun:
            return "Heavy Bowgun"
        case .bow:
            return "Bow"
        }
    }
}
