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
    
    @ObservedObject var bookmarkViewModel: EntityViewModel
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
    var locations: [Location]
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(largeMonsters) { largeMonster in
                        MonsterRowView(bookmarkViewModel: bookmarkViewModel, monster: largeMonster, locations: locations)
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
                        MonsterRowView(bookmarkViewModel: bookmarkViewModel, monster: smallMonster, locations: locations)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItemWithText(title: "Small")
            }
        }
            .navigationBarTitle("Monsters", displayMode: .inline)
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

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(menuOpened: .constant(false), bookmarkViewModel: EntityViewModel(), viewModel: MonstersViewModel(), locations: LocationsViewModel().data)
    }
}
