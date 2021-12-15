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
    
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    @ObservedObject var blademasterViewModel: BlademasterArmorsViewModel
    @ObservedObject var gunnerViewModel: GunnerArmorsViewModel
    
    @State var selection: Int = 0
    
    var allSkills: [Skill]
    
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
                        ArmorRowView(bookmarksViewModel: bookmarksViewModel, armorSet: blademasterArmor, allSkills: allSkills)
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
                        ArmorRowView(bookmarksViewModel: bookmarksViewModel, armorSet: gunnerArmor, allSkills: allSkills)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItemWithText(title: "Gunner")
            }
        }
    }
}

struct ArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorListView(menuOpened: .constant(false), bookmarksViewModel: BookmarksViewModel(), blademasterViewModel: BlademasterArmorsViewModel(), gunnerViewModel: GunnerArmorsViewModel(), allSkills: SkillsViewModel().data)
    }
}
