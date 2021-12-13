//
//  MinimizedSkillInfo.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct MinimizedSkillPointRowView: View {
    var skillName: String
    var skillPointNumber: Int
    
    var body: some View {
        HStack {
            Text(skillName)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("\(skillPointNumber)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct MinimizedSkillInfo_Previews: PreviewProvider {
    static var previews: some View {
        MinimizedSkillPointRowView(skillName: "Fencing", skillPointNumber: 10)
    }
}
