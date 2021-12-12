//
//  ArmorListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI
import PagerTabStripView

struct ArmorListView: View {
    @ObservedObject var blademasterViewModel: BlademasterArmorsViewModel
    @ObservedObject var gunnerViewModel: BlademasterArmorsViewModel
    
    var skills: [Skill]
    
    var blademasterArmors: [ArmorSet] {
        return blademasterViewModel.data
    }
    
    var body: some View {
        PagerTabStripView() {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(blademasterArmors) { blademasterArmor in
                        ArmorRowView(armorSet: blademasterArmor, skills: skills)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItem(title: "BLADEMASTER")
            }
            Text("--- UNDER CONSTRUCTION ---")
            .pagerTabItem {
                TitleNavBarItem(title: "GUNNER")
            }
        }
            .navigationBarTitle("Armors", displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarLeading,
                    content: {
                        MenuComponent()
                    }
                )
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarTrailing,
                    content: {
                        Button(
                            action: {},
                            label: {
                                Image(systemName: "magnifyingglass.circle")
                            }
                        )
                    }
                )
            }
    }
}

struct ArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorListView(blademasterViewModel: BlademasterArmorsViewModel(), gunnerViewModel: BlademasterArmorsViewModel(), skills: SkillsViewModel().data)
    }
}
