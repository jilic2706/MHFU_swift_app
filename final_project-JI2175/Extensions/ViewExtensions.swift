//
//  ViewExtensions.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
        if visibility != .gone {
            if visibility == .visible {
                self
            } else {
                hidden()
            }
        }
    }
}
