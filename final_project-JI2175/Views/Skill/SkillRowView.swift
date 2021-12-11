//
//  SkillRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct SkillRowView: View {
    var skill: Skill
    
    var body: some View {
        NavigationLink(
            destination: SkillDetailView(skill: skill)) {
            HStack(spacing: 14) {
                Text(skill.name)
                    .font(.headline)
                Spacer()
            }
                .padding()
        }.buttonStyle(PlainButtonStyle())
    }
}

struct SkillRowView_Previews: PreviewProvider {
    static var previews: some View {
        SkillRowView(skill: SkillsViewModel().data[0])
    }
}
