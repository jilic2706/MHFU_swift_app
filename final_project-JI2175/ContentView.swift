//
//  ContentView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import SwiftUI
import SideMenu

struct ContentView: View {
    @State private var menuOpened: Bool = false
    @State private var selection: Int = 0
    @State private var searchQuery: String = ""
    
    @ObservedObject private var bookmarkViewModel = EntityViewModel()
    @ObservedObject private var monstersViewModel = MonstersViewModel()
    @ObservedObject private var blademasterArmorsViewModel = BlademasterArmorsViewModel()
    @ObservedObject private var gunnerArmorsViewModel = GunnerArmorsViewModel()
    @ObservedObject private var locationsViewModel = LocationsViewModel()
    @ObservedObject private var skillsViewModel = SkillsViewModel()
    
    private var monsters: [Monster] {
        return monstersViewModel.data
    }
    private var blademasterArmors: [ArmorSet] {
        return blademasterArmorsViewModel.data
    }
    private var gunnerArmors: [ArmorSet] {
        return gunnerArmorsViewModel.data
    }
    private var skills: [Skill] {
        return skillsViewModel.data
    }
    private var locations: [Location] {
        return locationsViewModel.data
    }
    // This is here so that every entity could be searched from a common array(?)
    private var everything: [Entity] {
        var everything: [Entity] = []
        monsters.forEach { (everything.append($0 as Monster)) }
        blademasterArmors.forEach { (everything.append($0 as ArmorSet)) }
        gunnerArmors.forEach { (everything.append($0 as ArmorSet)) }
        skills.forEach { (everything.append($0 as Skill)) }
        locations.forEach { (everything.append($0 as Location)) }
        return everything
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                if(selection == 0) {
                    MonsterListView(menuOpened: $menuOpened, bookmarkViewModel: bookmarkViewModel, viewModel: monstersViewModel, locations: locations)
                } else if(selection == 2) {
                    ArmorListView(menuOpened: $menuOpened, blademasterViewModel: blademasterArmorsViewModel, gunnerViewModel: gunnerArmorsViewModel, skills: skills)
                } else if(selection == 5) {
                    SkillListView(menuOpened: $menuOpened, viewModel: skillsViewModel)
                } else if(selection == 7) {
                    LocationListView(menuOpened: $menuOpened, bookmarkViewModel: bookmarkViewModel, locationsViewModel: locationsViewModel)
                }
                else {
                    OOBView(selection: $selection)
                }
                
    //            VStack {
    //                Spacer()
    //                Text("hey.")
    //                Spacer()
    //            }
    //                .toolbar {
    //                    ToolbarItem(
    //                        placement: ToolbarItemPlacement.navigationBarTrailing,
    //                        content: {
    //                            HStack {
    //                                Spacer()
    //                                Image(systemName: "magnifyingglass.circle")
    //                                    .resizable()
    //                                    .frame(width: 21, height: 21)
    //                                TextField("Search", text: $searchQuery)
    //                                    .autocapitalization(.none)
    //                                Spacer()
    //                            }
    //                                .padding(.horizontal)
    //                                .frame(width: UIScreen.main.bounds.width)
    //                    })
    //                }
            }
                .accentColor(Color(.label))
            SideMenu(selection: $selection, width: UIScreen.main.bounds.width * 0.7, menuOpened: menuOpened, toggleMenu: toggleMenu)
        }
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
            
    }
}


