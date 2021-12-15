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
    
    func getAffinityColor() -> Color {
        switch weapon.affinity {
        case let aff where aff < 0: return Color.red
        case let aff where aff > 0: return Color.green
        default: return Color(.label)
        }
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
        ScrollView {
            LazyVStack {
                HStack(spacing: 14) {
                    Image("\(weapon.type.abbrev)\(rarityColor)")
                        .resizable()
                        .frame(width: 54, height: 54)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(weapon.name)
                            .font(.title2)
                            .foregroundColor(Color(rarityColor))
                        Text("RARE - \(weapon.rarity)")
                            .font(.body)
                            .foregroundColor(Color(rarityColor))
                    }
                    Spacer()
                }
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 14))
                Divider()
                    .background(Color("ModeDependantGray"))
                Text(weapon.description ?? "???")
                    .padding()
                Divider()
                    .background(Color("ModeDependantGray"))
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Attack")
                        Spacer()
                        Text("\(weapon.attack)")
                    }
                    HStack {
                        Text("Attribute")
                        Spacer()
                        if(!weapon.attribute.isEmpty) {
                            VStack {
                                ForEach(weapon.attribute, id: \.self) { attribute in
                                    Text("\(attribute.attributeType.description): \(attribute.attributeValue)")
                                }
                            }
                        } else {
                            Text("None")
                                .foregroundColor(Color.gray)
                        }
                    }
                    HStack {
                        Text("Affinity")
                        Spacer()
                        Text("\(weapon.affinity)%")
                            .foregroundColor(getAffinityColor())
                    }
                    HStack {
                        Text("Slots")
                        Spacer()
                        SlotNumberView(numberOfSlots: weapon.slots)
                    }
                        
                    HStack {
                        Text("Defense")
                        Spacer()
                        Text("\(weapon.defense)")
                    }
                    HStack {
                        Text("Sharpness")
                        Spacer()
                        VStack(spacing: 0) {
                            SharpnessBarView(sharpnessLevels: weapon.regSharpness, isSupersized: true)
                            if(!weapon.spoSharpness.isEmpty) {
                                SharpnessBarView(sharpnessLevels: weapon.spoSharpness, isSupersized: true)
                            }
                        }
                    }
                }
                    .padding(.horizontal)
                    .font(.subheadline)
                SectionTitleView(sectionLabel: "Weapon Tree")
                StreamlinedWeaponTreeView(bookmarksViewModel: bookmarksViewModel, weapon: weapon, appropriateWeapons: appropriateWeapons)
                    .padding(EdgeInsets(top: 14, leading: 0, bottom: 0, trailing: 0))
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
            weapon: WeaponProvider.shared.weapons[5],
            appropriateWeapons: WeaponProvider.shared.weapons
        )
            
    }
}
