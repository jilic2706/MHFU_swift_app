//
//  MonsterListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import SwiftUI

struct MonsterListView: View {
    @ObservedObject var viewModel: MonstersViewModel
    
    @State var selectedIndex = 0
    
    var locations: [Location]
    
    var body: some View {
        VStack(spacing: 0) {
            Picker(
                "Pick a monster size",
                selection: $selectedIndex,
                content: {
                    Text("LARGE").tag(0)
                    Text("SMALL").tag(1)
                }
            )
                .pickerStyle(SegmentedPickerStyle())
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.data) { monster in
                        if(selectedIndex == 0) {
                            if(monster.size == .large) {
                                MonsterRowView(monster: monster, locations: locations)
                                Divider()
                                    .background(Color("ModeDependantGray"))
                            }
                        } else if(selectedIndex == 1) {
                            if(monster.size == .small) {
                                MonsterRowView(monster: monster, locations: locations)
                                Divider()
                                    .background(Color("ModeDependantGray"))
                            }
                        }
                    }
                }
            }
        }
            .navigationBarTitle("Monsters")
            .navigationBarTitleDisplayMode(.inline)
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

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(viewModel: MonstersViewModel(), locations: LocationsViewModel().data)
    }
}
