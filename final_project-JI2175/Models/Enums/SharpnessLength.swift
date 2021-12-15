//
//  SharpnessLength.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation
import SwiftUI

enum SharpnessLength: Int, CustomStringConvertible, Codable {
    case xxs = 0
    case xs = 1
    case sm = 2
    case m = 3
    case lg = 4
    case xl = 5
    case xxl = 6
    
    var description: String {
        switch self {
        case .xxs: return "Extra extra small"
        case .xs: return "Extra small"
        case .sm: return "Small"
        case .m: return "Medium"
        case .lg: return "Large"
        case .xl: return "Extra large"
        case .xxl: return "Extra extra large"
        }
    }
    
    var length: Double {
        switch self {
        case .xxs: return 0.03
        case .xs: return 0.05
        case .sm: return 0.10
        case .m: return 0.15
        case .lg: return 0.20
        case .xl: return 0.25
        case .xxl: return 0.4
        }
    }
}
