//
//  ContentView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import SwiftUI

struct ContentView: View {
    @State private var currentMenuIndex = 1
    
    @ObservedObject private var monstersViewModel = MonstersViewModel()
    @ObservedObject private var blademasterArmorsViewModel = BlademasterArmorsViewModel()
    @ObservedObject private var locationsViewModel = LocationsViewModel()
    @ObservedObject private var skillsViewModel = SkillsViewModel()
    
    private var monsters: [Monster] {
        return monstersViewModel.data
    }
    private var locations: [Location] {
        return locationsViewModel.data
    }
    private var skills: [Skill] {
        return skillsViewModel.data
    }
    
    var body: some View {
        NavigationView {
            //MonsterListView(viewModel: monstersViewModel, locations: locations)
            //SkillListView(viewModel: skillsViewModel)
            ArmorListView(blademasterViewModel: blademasterArmorsViewModel, gunnerViewModel: blademasterArmorsViewModel, skills: skills)
        }
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
