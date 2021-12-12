//
//  ArmorDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI
import PagerTabStripView

struct ArmorDetailView: View {
    var armorSet: ArmorSet
    var skills: [Skill]
    
    @State var currentTab = 3
    
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
        PagerTabStripView(selection: $currentTab) {
            ScrollView {
                LazyVStack {
                    HStack {
                        ZStack {
                            Image("chest\(rarityColor)")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text("RARE-\(armorSet.rarity)")
                                .font(.body)
                                .foregroundColor(Color(rarityColor))
                        }
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItem(title: "Set")
            }
            Text("HEAD")
            .pagerTabItem {
                TitleNavBarItemWithImage(imageName: "helm\(rarityColor)")
            }
            Text("CHEST")
            .pagerTabItem {
                TitleNavBarItemWithImage(imageName: "chest\(rarityColor)")
            }
            Text("ARMS")
            .pagerTabItem {
                TitleNavBarItemWithImage(imageName: "arms\(rarityColor)")
            }
            Text("WAIST")
            .pagerTabItem {
                TitleNavBarItemWithImage(imageName: "waist\(rarityColor)")
            }
            Text("LEGS")
            .pagerTabItem {
                TitleNavBarItemWithImage(imageName: "legs\(rarityColor)")
            }
        }
            .pagerTabStripViewStyle(.barButton(indicatorBarColor: .blue))
            .navigationBarTitle(armorSet.name, displayMode: .inline)
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

struct ArmorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorDetailView(armorSet: BlademasterArmorsViewModel().data[1], skills: SkillsViewModel().data)
    }
}
