//
//  SkillDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct SkillDetailView: View {
    var skill: Skill
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text(skill.description ?? "???")
                    .font(.body)
                    .padding()
                SectionTitleView(sectionLabel: "Positive effects")
                ForEach(skill.thresholds[0], id: \.self) { negativeThreshold in
                    HStack {
                        Text(negativeThreshold.effectName)
                            .font(.body)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(negativeThreshold.reqSkillPoints)")
                            .font(.body)
                    }
                    .padding()
                }
                if(!skill.thresholds[1].isEmpty) {
                    SectionTitleView(sectionLabel: "Negative effects")
                    ForEach(skill.thresholds[1], id: \.self) { negativeThreshold in
                        HStack {
                            Text(negativeThreshold.effectName)
                                .font(.body)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(negativeThreshold.reqSkillPoints)")
                                .font(.body)
                        }
                        .padding()
                    }
                }
            }
        }
            .navigationBarTitle(skill.name, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "magnifyingglass.circle")
                        }
                    )
            )
    }
}

struct SkillDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkillDetailView(skill: Skill(id: 1, name: "Attack", description: "Increases or decreases the hunter's attack power.", entityType: .skill, thresholds: [[SkillEffect(effectName: "Attack Up (Large)", reqSkillPoints: 20), SkillEffect(effectName: "Attack Up (Medium)", reqSkillPoints: 15), SkillEffect(effectName: "Attack Up (Small)", reqSkillPoints: 10)], [SkillEffect(effectName: "Attack Down (Large)", reqSkillPoints: -20), SkillEffect(effectName: "Attack Down (Medium)", reqSkillPoints: -15), SkillEffect(effectName: "Skill Down (Small)", reqSkillPoints: -10)]]))
            .preferredColorScheme(.dark)
    }
}
