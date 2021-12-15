//
//  MonsterListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import SwiftUI
import PagerTabStripView

struct MonsterListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    @ObservedObject var viewModel: MonstersViewModel
    
    @State private var selection = 0
    
    var largeMonsters: [Monster] {
        return viewModel.data.filter {
            $0.size == .large
        }
    }
    var smallMonsters: [Monster] {
        return viewModel.data.filter {
            $0.size == .small
        }
    }
    var allLocations: [Location]
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(largeMonsters) { largeMonster in
                        MonsterRowView(bookmarksViewModel: bookmarksViewModel, monster: largeMonster, allLocations: allLocations)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItemWithText(title: "Large")
            }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(smallMonsters) { smallMonster in
                        MonsterRowView(bookmarksViewModel: bookmarksViewModel, monster: smallMonster, allLocations: allLocations)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItemWithText(title: "Small")
            }
        }
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(menuOpened: .constant(false), bookmarksViewModel: BookmarksViewModel(), viewModel: MonstersViewModel(), allLocations: LocationsViewModel().data)
    }
}
