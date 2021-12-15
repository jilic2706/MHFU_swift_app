//
//  SharpnessBarView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct SharpnessBarView: View {
    var sharpnessLevels: [Sharpness]
    var isSupersized: Bool
    
    var barLength: CGFloat {
        if(self.isSupersized) {
            return UIScreen.main.bounds.width * 0.5
        } else {
            return UIScreen.main.bounds.width * 0.25
        }
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline,spacing: 0) {
            ForEach(sharpnessLevels, id: \.self) { sharpness in
                Rectangle()
                    .fill(sharpness.sharpnessType.color)
                    .frame(width: barLength * sharpness.sharpnessValue.length, height: 5)
                
            }
            Spacer()
        }
        .offset(x: 1)
            .frame(width: barLength, height: 7)
            .background(Color("ModeDependantGray"))
    }
}

struct SharpnessBarView_Previews: PreviewProvider {
    static var previews: some View {
        SharpnessBarView(
            sharpnessLevels: [
                Sharpness(sharpnessType: .red, sharpnessValue: .m),
                Sharpness(sharpnessType: .orange, sharpnessValue: .m),
                Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                Sharpness(sharpnessType: .green, sharpnessValue: .sm),
                Sharpness(sharpnessType: .blue, sharpnessValue: .m)
        ],
        isSupersized: true)
    }
}
