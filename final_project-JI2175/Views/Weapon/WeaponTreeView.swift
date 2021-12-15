//
//  WeaponRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct WeaponTreeView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var weapon: Weapon
    var offset: Int
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
    
    func getOffset(offset: Int) -> Int {
        return offset + 3
    }
    
    var body: some View {
        NavigationLink(
            destination: WeaponDetailView(bookmarksViewModel: bookmarksViewModel, weapon: weapon, appropriateWeapons: appropriateWeapons)) {
                VStack(spacing: 0) {
                    ZStack {
                        HStack() {
                            VStack(alignment: .leading, spacing: 7) {
                                Text(weapon.name)
                                    .font(.headline)
                                    .foregroundColor(Color(rarityColor))
                                HStack() {
                                    HStack(spacing: 3.5) {
                                        Image("attack")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                        Text("\(weapon.attack)")
                                            .font(.subheadline)
                                            .foregroundColor(Color(.label).opacity(0.75))
                                    }
                                    if(!weapon.attribute.isEmpty) {
                                        ForEach(weapon.attribute, id: \.self) { attribute in
                                            HStack(alignment: .center) {
                                                Text("+")
                                                Text("\(attribute.attributeType.description): \(attribute.attributeValue)")
                                            }
                                                .font(.caption2)
                                                .foregroundColor(Color(.label).opacity(0.5))
                                        }
                                    }
                                }
                            }
                            .padding(14)
                            Spacer()
                        }
                            .border(width: 1, edges: [.bottom, .top], color: Color("ModeDependantGray").opacity(0.5))
                            .border(width: 3.5, edges: [.leading], color: Color(rarityColor))
                            .offset(x: CGFloat(offset))
                        HStack() {
                            Spacer()
                            VStack {
                                VStack(alignment: .leading, spacing: 0) {
                                    SharpnessBarView(sharpnessLevels: weapon.regSharpness, isSupersized: false)
                                    if(!weapon.spoSharpness.isEmpty) {
                                        SharpnessBarView(sharpnessLevels: weapon.spoSharpness, isSupersized: false)
                                    }
                                }
                                HStack {
                                    Text("\(weapon.affinity)")
                                    SlotNumberView(numberOfSlots: weapon.slots)
                                }
                            }
                        }
                            .padding(.horizontal, 7)
                    }
                    if(!weapon.children.isEmpty) {
                        ForEach(weapon.children, id: \.self) { child in
                            WeaponTreeView(bookmarksViewModel: bookmarksViewModel, weapon: getWeapon(id: child), offset: weapon.children.isEmpty ? 0 : getOffset(offset: offset), appropriateWeapons: appropriateWeapons)
                        }
                    }
                }
        }
    }
}

struct WeaponTreeView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponTreeView(
            bookmarksViewModel: BookmarksViewModel(),
            weapon: WeaponProvider.shared.weapons[0],
            offset: 0,
            appropriateWeapons: WeaponProvider.shared.weapons
        )
    }
}
