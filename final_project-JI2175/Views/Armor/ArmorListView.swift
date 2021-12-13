//
//  ArmorListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI
import PagerTabStripView

struct ArmorListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var blademasterViewModel: BlademasterArmorsViewModel
    @ObservedObject var gunnerViewModel: GunnerArmorsViewModel
    
    @State var selection: Int = 0
    
    var skills: [Skill]
    
    var blademasterArmors: [ArmorSet] {
        return blademasterViewModel.data
    }
    var gunnerArmors: [ArmorSet] {
        return gunnerViewModel.data
    }
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
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
                TitleNavBarItemWithText(title: "Blademaster")
            }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(gunnerArmors) { gunnerArmor in
                        ArmorRowView(armorSet: gunnerArmor, skills: skills)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItemWithText(title: "Gunner")
            }
        }
            .navigationBarTitle("Armors", displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarLeading,
                    content: {
                        Button(
                            action: {
                                self.menuOpened.toggle()
                            },
                            label: {
                                Image(systemName: "list.dash")
                            }
                        )
                    }
                )
            }
    }
}

struct ArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorListView(menuOpened: .constant(false), blademasterViewModel: BlademasterArmorsViewModel(), gunnerViewModel: GunnerArmorsViewModel(), skills: SkillsViewModel().data)
    }
}
