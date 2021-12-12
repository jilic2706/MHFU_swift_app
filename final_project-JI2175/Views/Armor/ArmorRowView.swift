//
//  ArmorRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI

struct ArmorRowView: View {
    var armorSet: ArmorSet
    var skills: [Skill]
    
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
    
    var body: some View {
        NavigationLink(
            destination: ArmorDetailView(armorSet: armorSet, skills: skills)) {
            HStack(spacing: 14) {
                Text(armorSet.name)
                    .font(.headline)
                    .foregroundColor(Color(rarityColor))
                Spacer()
            }
                .padding()
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ArmorRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorRowView(armorSet: BlademasterArmorsViewModel().data[0], skills: SkillsViewModel().data)
    }
}
