//
//  ContentView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import SwiftUI

struct ContentView: View {
    @State private var isMenuShown = false
    @State private var currentMenuIndex = 1
    
    @ObservedObject private var monstersViewModel = MonstersViewModel()
    @ObservedObject private var locationsViewModel = LocationsViewModel()
    
    private var monsters: [Monster] {
        return monstersViewModel.data
    }
    private var locations: [Location] {
        return locationsViewModel.data
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if isMenuShown {
                    MenuComponent()
                }
                MonsterListView(isMenuShown: $isMenuShown, viewModel: monstersViewModel, locations: locations)
            }
        }
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
