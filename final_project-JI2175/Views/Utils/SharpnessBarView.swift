//
//  SharpnessBarView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct SharpnessBarView: View {
    var sharpnessLevels: [Sharpness]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(sharpnessLevels, id: \.self) { sharpness in
                Rectangle()
                    .fill(sharpness.sharpnessLevel.color)
                    .frame(width: CGFloat(sharpness.sharpnessValue), height: 7)
                
            }
        }
    }
}

struct SharpnessBarView_Previews: PreviewProvider {
    static var previews: some View {
        SharpnessBarView(sharpnessLevels: [
            Sharpness(sharpnessLevel: .red, sharpnessValue: 20),
            Sharpness(sharpnessLevel: .orange, sharpnessValue: 20),
            Sharpness(sharpnessLevel: .yellow, sharpnessValue: 10),
            Sharpness(sharpnessLevel: .green, sharpnessValue: 0),
            Sharpness(sharpnessLevel: .blue, sharpnessValue: 0)
        ])
    }
}
