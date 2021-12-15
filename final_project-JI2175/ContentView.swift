//
//  ContentView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import SwiftUI

struct ContentView: View {
    @State private var menuOpened: Bool = false
    @State private var selection: Int = 0
    @State private var searchQuery: String = ""
    
    @ObservedObject private var bookmarksViewModel = BookmarksViewModel()
    @ObservedObject private var monstersViewModel = MonstersViewModel()
    @ObservedObject private var weaponsViewModel = WeaponsViewModel()
    @ObservedObject private var blademasterArmorsViewModel = BlademasterArmorsViewModel()
    @ObservedObject private var gunnerArmorsViewModel = GunnerArmorsViewModel()
    @ObservedObject private var locationsViewModel = LocationsViewModel()
    @ObservedObject private var skillsViewModel = SkillsViewModel()
    
    private var navigationTitle: String {
        switch selection {
        case 0: return "Monsters"
        case 1: return "Weapons"
        case 2: return "Armors"
        case 3: return "Quests"
        case 4: return "Items"
        case 5: return "Skills"
        case 6: return "Decorations"
        case 7: return "Locations"
        case 8: return "Bookmarks"
        default: return "Things Betwixt"
        }
    }
    
    private var allMonsters: [Monster] {
        return monstersViewModel.data
    }
    private var allWeapons: [Weapon] {
        return weaponsViewModel.data
    }
    private var allBlademasterArmors: [ArmorSet] {
        return blademasterArmorsViewModel.data
    }
    private var allGunnerArmors: [ArmorSet] {
        return gunnerArmorsViewModel.data
    }
    private var allSkills: [Skill] {
        return skillsViewModel.data
    }
    private var allLocations: [Location] {
        return locationsViewModel.data
    }
    private var allBookmarks: [Entity] {
        return bookmarksViewModel.bookmarks
    }
    
    /**
     * This was supposed to be used for the universal search functionality that I never got around to finishing. Oh well!
     */
//    private var everything: [Entity] {
//        var everything: [Entity] = []
//        allMonsters.forEach { (everything.append($0 as Monster)) }
//        allBlademasterArmors.forEach { (everything.append($0 as ArmorSet)) }
//        allGunnerArmors.forEach { (everything.append($0 as ArmorSet)) }
//        allSkills.forEach { (everything.append($0 as Skill)) }
//        allLocations.forEach { (everything.append($0 as Location)) }
//        return everything
//    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                Group {
                    if(selection == 0) {
                        MonsterListView(menuOpened: $menuOpened, bookmarksViewModel: bookmarksViewModel, viewModel: monstersViewModel, allLocations: allLocations)
                    } else if(selection == 1) {
                        WeaponTypeListView(menuOpened: $menuOpened, bookmarksViewModel: bookmarksViewModel, weaponsViewModel: weaponsViewModel)
                    } else if(selection == 2) {
                        ArmorListView(menuOpened: $menuOpened, bookmarksViewModel: bookmarksViewModel, blademasterViewModel: blademasterArmorsViewModel, gunnerViewModel: gunnerArmorsViewModel, allSkills: allSkills)
                    } else if(selection == 5) {
                        SkillListView(menuOpened: $menuOpened, viewModel: skillsViewModel)
                    } else if(selection == 7) {
                        LocationListView(menuOpened: $menuOpened, bookmarksViewModel: bookmarksViewModel, viewModel: locationsViewModel)
                    } else if(selection == 8) {
                        BookmarkListView(menuOpened: $menuOpened, bookmarksViewModel: bookmarksViewModel, allSkills: allSkills, allLocations: allLocations)
                    }
                    else {
                        OOBView(selection: $selection)
                    }
                }
                .navigationBarTitle(navigationTitle, displayMode: .inline)
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


