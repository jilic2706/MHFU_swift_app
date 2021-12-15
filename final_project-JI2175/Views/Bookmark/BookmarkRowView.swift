//
//  BookmarkRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct BookmarkRowView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var entity: Entity
    var allWeapons: [Weapon]
    var allSkills: [Skill]
    var allLocations: [Location]
    
    @ViewBuilder func getDestinationType(entity: Entity) -> some View {
        switch entity.entityType {
        case .monster: MonsterDetailView(bookmarksViewModel: bookmarksViewModel, monster: entity as! Monster, allLocations: allLocations)
        case .weapon: WeaponDetailView(bookmarksViewModel: bookmarksViewModel, weapon: entity as! Weapon, appropriateWeapons: allWeapons)
        case .armor: ArmorDetailView(bookmarksViewModel: bookmarksViewModel, armorSet: entity as! ArmorSet, allSkills: allSkills)
        case .quest: Text("Quest")
        case .item: Text("Item")
        case .skill: SkillDetailView(skill: entity as! Skill)
        case .decoration: Text("Decoration")
        case .location: LocationDetailView(bookmarksViewModel: bookmarksViewModel, location: entity as! Location)
        }
    }
    
    var body: some View {
        NavigationLink(destination: getDestinationType(entity: entity)) {
            HStack {
                Text(entity.name)
                Spacer()
                Text(entity.entityType.description)
            }
        }
            .padding()
    }
}

struct BookmarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkRowView(bookmarksViewModel: BookmarksViewModel(), entity: Entity(id: 1, name: "Maximillian", description: "", entityType: .monster), allWeapons: WeaponProvider.shared.weapons, allSkills: SkillsViewModel().data, allLocations: LocationsViewModel().data)
    }
}
