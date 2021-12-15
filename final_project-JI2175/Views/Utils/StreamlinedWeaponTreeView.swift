//
//  StreamlinedWeaponTreeView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 15.12.2021..
//

import SwiftUI

struct ParentWeaponRow: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var weapon: Weapon
    var appropriateWeapons: [Weapon]
    
    func getWeapon(id: Int) -> Weapon {
        guard let weapon = appropriateWeapons.first(where: { $0.id == id }) else {
            return Entity(id: 0, name: "n/A", description: "", entityType: .weapon) as! Weapon
        }
        return weapon
    }
    
    var rarityColor: String {
        switch weapon.rarity {
        case 1, 2, 3: return "-rarity-1"
        case 4: return "-rarity-4"
        case 5: return "-rarity-5"
        case 6: return "-rarity-6"
        case 7: return "-rarity-7"
        case 8: return "-rarity-8"
        case 9: return "-rarity-9"
        case 10: return "-rarity-10"
        default: return "-rarity-1"
        }
    }
    
    var body: some View {
        VStack(spacing: 14) {
            if(!weapon.parents.isEmpty) {
                VStack {
                    ForEach(weapon.parents, id: \.self) { parent in
                        ParentWeaponRow(bookmarksViewModel: bookmarksViewModel, weapon: getWeapon(id: parent), appropriateWeapons: appropriateWeapons)
                    }
                }
            }
            NavigationLink(destination: WeaponDetailView(bookmarksViewModel: bookmarksViewModel, weapon: weapon, appropriateWeapons: appropriateWeapons)) {
                VStack(spacing: 7) {
                    HStack {
                        Spacer()
                        Text(weapon.name)
                            .font(.subheadline)
                            .foregroundColor(Color(.label).opacity(0.8))
                        Spacer()
                    }
                    Image(systemName: "arrow.down")
                }
            }
                .buttonStyle(PlainButtonStyle())
        }
    }
}

struct StreamlinedWeaponTreeView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var weapon: Weapon
    var appropriateWeapons: [Weapon]
    
    func getWeapon(id: Int) -> Weapon {
        guard let weapon = appropriateWeapons.first(where: { $0.id == id }) else {
            return Entity(id: 0, name: "n/A", description: "", entityType: .weapon) as! Weapon
        }
        return weapon
    }
    
    var rarityColor: String {
        switch weapon.rarity {
        case 1, 2, 3: return "-rarity-1"
        case 4: return "-rarity-4"
        case 5: return "-rarity-5"
        case 6: return "-rarity-6"
        case 7: return "-rarity-7"
        case 8: return "-rarity-8"
        case 9: return "-rarity-9"
        case 10: return "-rarity-10"
        default: return "-rarity-1"
        }
    }
    
    var body: some View {
        VStack(spacing: 14) {
            if(!weapon.parents.isEmpty) {
                ForEach(weapon.parents, id: \.self) { parent in
                    ParentWeaponRow(bookmarksViewModel: bookmarksViewModel, weapon: getWeapon(id: parent), appropriateWeapons: appropriateWeapons)
                }
            }
            HStack {
                Spacer()
                Text(weapon.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                Spacer()
            }
            if(!weapon.children.isEmpty) {
                Image(systemName: "arrow.down")
                VStack(spacing: 14) {
                    ForEach(weapon.children, id: \.self) { child in
                        NavigationLink(destination: WeaponDetailView(bookmarksViewModel: bookmarksViewModel, weapon: getWeapon(id: child), appropriateWeapons: appropriateWeapons)) {
                            HStack {
                                Spacer()
                                Text("\(getWeapon(id: child).name)")
                                    .font(.subheadline)
                                    .foregroundColor(Color(.label).opacity(0.8))
                                Spacer()
                            }
                        }
                            .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct StreamlinedWeaponTreeView_Previews: PreviewProvider {
    static var previews: some View {
        StreamlinedWeaponTreeView(
            bookmarksViewModel: BookmarksViewModel(),
            weapon: WeaponProvider.shared.weapons[2],
            appropriateWeapons: WeaponProvider.shared.weapons
        )
    }
}
