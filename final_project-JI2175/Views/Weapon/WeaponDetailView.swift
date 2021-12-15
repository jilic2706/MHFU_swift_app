//
//  WeaponDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct WeaponDetailView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var weapon: Weapon
    var appropriateWeapons: [Weapon]
    var rarityColor: String
    
    func getWeapon(id: Int) -> Weapon {
        guard let weapon = appropriateWeapons.first(where: { $0.id == id }) else {
            return Entity(id: 0, name: "n/A", description: "", entityType: .weapon) as! Weapon
        }
        return weapon
    }
    
    var isBookmarked: String {
        if(bookmarksViewModel.entityAlreadyBookmarked(entity: weapon)) {
            return "bookmark.fill"
        } else {
            return "bookmark"
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack(spacing: 14) {
                    Image("\(weapon.type.abbrev)\(rarityColor)")
                        .resizable()
                        .frame(width: 54, height: 54)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(weapon.name)
                            .font(.title2)
                            .foregroundColor(Color("\(rarityColor)"))
                        Text("RARE - \(weapon.rarity)")
                            .font(.body)
                            .foregroundColor(Color("\(rarityColor)"))
                    }
                    Spacer()
                }
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 14))
                Divider()
                    .background(Color("ModeDependantGray"))
                HStack {
                    VStack {
                        Text("TYPE")
                            .font(.caption)
                        Text("\(weapon.type.description.uppercased())")
                            .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("SLOTS")
                            .font(.caption)
                        SlotNumberView(numberOfSlots: weapon.slots)
                    }
                    Spacer()
                    VStack {
                        Text("DEFENSE")
                            .font(.caption)
                        Text("\(weapon.attack)")
                            .font(.body)
                    }
                }
                    .padding()
                Divider()
                    .background(Color("ModeDependantGray"))
                Text(weapon.description ?? "???")
                    .padding()
            }
        }
            .navigationBarTitle(weapon.name, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            bookmarksViewModel.toggleBookmark(entity: weapon)
                        },
                        label: {
                            Image(systemName: isBookmarked)
                        }
                    )
                )
    }
}

struct WeaponDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponDetailView(
            bookmarksViewModel: BookmarksViewModel(),
            weapon: WeaponProvider.shared.weapons[0],
            appropriateWeapons: WeaponProvider.shared.weapons,
            rarityColor: "-rarity-1"
        )
    }
}
