//
//  ArmorPieceView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI

struct ArmorPieceView: View {
    var armorPiece: ArmorPiece
    var skills: [Skill]
    var rarity: Int
    
    func getSkillName(id: Int) -> String {
        guard let skill = skills.first(where: { $0.id == id }) else {
            return ""
        }
        return skill.name
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack(spacing: 14) {
                    Image("\(armorPiece.type.description)-rarity-\(rarity)")
                        .resizable()
                        .frame(width: 54, height: 54)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(armorPiece.name)
                            .font(.title2)
                            .foregroundColor(Color("-rarity-\(rarity)"))
                        Text("RARE - \(rarity)")
                            .font(.body)
                            .foregroundColor(Color("-rarity-\(rarity)"))
                    }
                    Spacer()
                }
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 14))
                Divider()
                    .background(Color("ModeDependantGray"))
                HStack {
                    VStack {
                        Text("PIECE")
                            .font(.caption)
                        Text("\(armorPiece.type.description.capitalized)")
                            .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("SLOTS")
                            .font(.caption)
                        SlotNumberView(numberOfSlots: armorPiece.slots)
                    }
                    Spacer()
                    VStack {
                        Text("DEFENSE")
                            .font(.caption)
                        Text("\(armorPiece.physicalDefense)")
                            .font(.body)
                    }
                }
                    .padding()
                Divider()
                    .background(Color("ModeDependantGray"))
                Text(armorPiece.description)
                    .padding()
                SectionTitleView(sectionLabel: "Resistances")
                VStack(spacing: 3.5) {
                    ForEach(ArmorResistance.allCases, id: \.self) { res in
                        ResistanceRowView(resistanceType: res.description, resistanceNumber: armorPiece.elementalDefenses[res.description] ?? 0)
                        if(res.description != "Dragon") {
                            Divider()
                                .background(Color("ModeDependantGray"))
                        }
                    }
                }
                SectionTitleView(sectionLabel: "Skills")
                VStack(alignment: .trailing, spacing: 3.5) {
                    ForEach(armorPiece.skillPoints, id: \.self) { skillPoint in
                        SkillPointRowView(skillPoint: skillPoint, skills: skills)
                    }
                }
            }
        }
    }
}

struct ArmorPieceView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorPieceView(armorPiece: ArmorProvider.shared.armorSet.armorPieces[0], skills: SkillProvider.shared.skills, rarity: 10)
            .preferredColorScheme(.light)
    }
}
