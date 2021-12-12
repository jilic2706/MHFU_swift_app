//
//  MonsterListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import SwiftUI
import PagerTabStripView

struct MonsterListView: View {
    @ObservedObject var viewModel: MonstersViewModel
    
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
        PagerTabStripView() {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(largeMonsters) { largeMonster in
                        MonsterRowView(monster: largeMonster, locations: locations)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItem(title: "LARGE")
            }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(smallMonsters) { smallMonster in
                        MonsterRowView(monster: smallMonster, locations: locations)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
            .pagerTabItem {
                TitleNavBarItem(title: "SMALL")
            }
        }
            .navigationBarTitle("Monsters", displayMode: .inline)
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

struct TitleNavBarItem: View {
    let title: String

    var body: some View {
        VStack {
            Text(title.uppercased())
                .foregroundColor(Color.gray)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct TitleNavBarItemWithImage: View {
    let imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 21, height: 21)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(viewModel: MonstersViewModel(), locations: LocationsViewModel().data)
    }
}
