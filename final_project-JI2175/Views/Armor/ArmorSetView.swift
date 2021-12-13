//
//  ArmorSetView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI

struct ArmorSetView: View {    
    var armorSet: ArmorSet
    var skills: [Skill]
    var rarityColor: String
    
    func getSkillName(id: Int) -> String {
        guard let skill = skills.first(where: { $0.id == id }) else {
            return ""
        }
        return skill.name
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    VStack {
                        Text("RARITY")
                            .font(.caption)
                        Text("\(armorSet.rarity)")
                            .font(.headline)
                            .foregroundColor(Color(rarityColor))
                    }
                    Spacer()
                    VStack {
                        Text("SLOTS")
                            .font(.caption)
                        Text("\(armorSet.totalSlots)")
                            .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("DEFENSE")
                            .font(.caption)
                        Text("\(armorSet.totalPhysicalDefense)")
                            .font(.headline)
                    }
                }
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 14))
                SectionTitleView(sectionLabel: "Resistances")
                VStack(spacing: 3.5) {
                    ForEach(ArmorResistance.allCases, id: \.self) { res in
                        ResistanceRowView(resistanceType: res.description, resistanceNumber: armorSet.totalElementalDefenses[res.description] ?? 0)
                        if(res.description != "Dragon") {
                            Divider()
                                .background(Color("ModeDependantGray"))
                        }
                    }
                }
                SectionTitleView(sectionLabel: "Skills")
                VStack(alignment: .trailing, spacing: 3.5) {
                    ForEach(armorSet.totalSkillPoints, id: \.self) { skillPoint in
                        SkillPointRowView(skillPoint: skillPoint, skills: skills)
                    }
                }
            }
        }
    }
}

struct ArmorSetView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorSetView(armorSet: ArmorProvider.shared.armorSet, skills: SkillProvider.shared.skills, rarityColor: "-rarity-10")
    }
}
