//
//  SkillPointRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct SkillPointRowView: View {
    var skillPoint: SkillPoint
    var allSkills: [Skill]
    
    func getSkill(id: Int) -> Skill? {
        guard let skill = allSkills.first(where: { $0.id == id }) else {
            return nil
        }
        return skill
    }
    
    var body: some View {
        NavigationLink(
            destination: SkillDetailView(skill: getSkill(id: skillPoint.skillId) ?? Entity(id: 0, name: "n/A", description: "n/A", entityType: .skill) as! Skill)) {
            HStack {
                Text(getSkill(id: skillPoint.skillId)?.name ?? "")
                    .font(.headline)
                Spacer()
                Text("\(skillPoint.skillQuantity)")
                    .font(.subheadline)
                Image(systemName: "chevron.right")
            }
                .padding(.horizontal)
                .padding(.vertical, 7)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct SkillPointRowView_Previews: PreviewProvider {
    static var previews: some View {
        SkillPointRowView(skillPoint: SkillPoint(skillId: 6001, skillQuantity: 15), allSkills: SkillProvider.shared.skills)
    }
}
