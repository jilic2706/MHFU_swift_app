//
//  ArmorRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI

struct ArmorRowView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var armorSet: ArmorSet
    var allSkills: [Skill]
    
    var rarityColor: String {
        switch armorSet.rarity {
        case 1, 2, 3: return "-rarity-1"
        case 4: return "-rarity-4"
        case 5: return "-rarity-5"
        case 6: return "-rarity-6"
        case 7: return "-rarity-7"
        case 8: return "-rarity-8"
        case 9: return "-rarity-9"
        case 10: return "-rarity-10"
        default: return "-rarity-1"
        }
    }
    
    func getSkillName(id: Int) -> String {
        guard let skill = allSkills.first(where: { $0.id == id }) else {
            return ""
        }
        return skill.name
    }
    
//    func getSkillEffectName(id: Int, quantity: Int) -> String {
//        guard let skill = skills.first(where: { $0.id == id }) else {
//            return ""
//        }
//        var name: String = ""
//        outerloop: for threshold in skill.thresholds {
//            var currentThreshold = 0
//            var previousThreshold = 0
//            innerloop: for effect in threshold {
//                if(previousThreshold != currentThreshold) {
//                    previousThreshold = currentThreshold
//                    print("Previous threshold is: \(previousThreshold)")
//                }
//                currentThreshold = effect.reqSkillPoints
//                print("Current threshold is: \(currentThreshold)")
//                print("Quantity is: \(quantity)")
//
//                if(quantity < 10 && quantity > -10 && id != 6100) {
//                    break outerloop
//                }
//
//                if(quantity > 0) {
//                    if(quantity >= currentThreshold) {
//                        name = effect.effectName
//                        break outerloop
//                    }
//                } else if(quantity < 0) {
//                    if(quantity <= currentThreshold) {
//                        name = effect.effectName
//                    }
//                    if(quantity < -20) {
//                        name = effect.effectName
//                        break outerloop
//                    }
//                    if(previousThreshold < 0 && quantity < previousThreshold) {
//                        break outerloop
//                    }
//                }
//            }
//        }
//        return name
//    }
    
    var body: some View {
        NavigationLink(
            destination: ArmorDetailView(bookmarksViewModel: bookmarksViewModel, armorSet: armorSet, allSkills: allSkills)) {
            ZStack {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 3.5) {
                        Text(armorSet.name)
                            .font(.headline)
                            .foregroundColor(Color(rarityColor))
                        HStack(spacing: 3.5) {
                            Image("defense")
                                .resizable()
                                .frame(width: 14, height: 14)
                            Text("\(armorSet.totalPhysicalDefense)")
                                .font(.subheadline)
                                .foregroundColor(Color(.label).opacity(0.75))
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 3.5) {
                        ForEach(armorSet.totalSkillPoints, id: \.self) { skillPoint in
                            MinimizedSkillPointRowView(skillName: getSkillName(id: skillPoint.skillId), skillPointNumber: skillPoint.skillQuantity)
//                                if(getSkillEffectName(id: skillPoint.skillId, quantity: skillPoint.skillQuantity) != "") {
//                                    Text(getSkillEffectName(id: skillPoint.skillId, quantity: skillPoint.skillQuantity))
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
                        }
                    }
                }
                VStack(alignment: .center, spacing: 3.5) {
                    ForEach(armorSet.armorPieces, id: \.self) { armorPiece in
                        if(armorPiece.slots == 0) {
                            SlotNumberView(numberOfSlots: 0)
                        } else if(armorPiece.slots == 1) {
                            SlotNumberView(numberOfSlots: 1)
                        } else if(armorPiece.slots == 2) {
                            SlotNumberView(numberOfSlots: 2)
                        } else if(armorPiece.slots == 3) {
                            SlotNumberView(numberOfSlots: 3)
                        }
                    }
                }
            }
                .padding()
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ArmorRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorRowView(bookmarksViewModel: BookmarksViewModel(), armorSet: ArmorProvider.shared.armorSet, allSkills: SkillProvider.shared.skills)
    }
}
