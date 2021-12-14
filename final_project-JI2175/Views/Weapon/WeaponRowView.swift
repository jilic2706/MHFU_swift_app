//
//  WeaponRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct WeaponRowView: View {
    @ObservedObject var bookmarkViewModel: EntityViewModel
    
    var weapon: Weapon
    var allWeapons: [Weapon]
    
    func getChildWeapon(id: Int) -> Weapon {
        guard let childWeapon = allWeapons.first(where: { $0.id == id }) else {
            return Entity(id: 0, name: "n/A", description: "", entityType: .weapon) as! Weapon
        }
        return childWeapon
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
        NavigationLink(
            destination: WeaponDetailView(bookmarkViewModel: bookmarkViewModel, weapon: weapon, allWeapons: allWeapons)) {
            VStack{
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 3.5) {
                        Text(weapon.name)
                            .font(.headline)
                            .foregroundColor(Color(rarityColor))
                        HStack(spacing: 3.5) {
                            Text("\(weapon.attack)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                }
//                if(!weapon.children.isEmpty) {
//                    ForEach(weapon.children, id: \.self) { childIn in
//
//                    }
//                }
            }
            .padding(.horizontal)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct WeaponRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponRowView(
            bookmarkViewModel: EntityViewModel(),
            weapon: Weapon(
                id: 1000,
                name: "Iron Katana 'Grace'",
                description: "Made with technology from the Orient. A strong Sword, but reqires maintenance.",
                entityType: .weapon,
                rarity: 2,
                type: .longSword,
                attack: 528,
                attribute: [],
                affinity: 0,
                slots: 0,
                defense: 0,
                regSharpness: [
                    Sharpness(sharpnessLevel: .red, sharpnessValue: 10),
                    Sharpness(sharpnessLevel: .orange, sharpnessValue: 5),
                    Sharpness(sharpnessLevel: .yellow, sharpnessValue: 20),
                    Sharpness(sharpnessLevel: .green, sharpnessValue: 10)
                ],
                spoSharpness: [],
                parents: [],
                children: [
                    1001
                ]
            ),
            allWeapons: [
                Weapon(
                    id: 1000,
                    name: "Iron Katana 'Grace'",
                    description: "Made with technology from the Orient. A strong Sword, but reqires maintenance.",
                    entityType: .weapon,
                    rarity: 2,
                    type: .longSword,
                    attack: 528,
                    attribute: [],
                    affinity: 0,
                    slots: 0,
                    defense: 0,
                    regSharpness: [
                        Sharpness(sharpnessLevel: .red, sharpnessValue: 10),
                        Sharpness(sharpnessLevel: .orange, sharpnessValue: 5),
                        Sharpness(sharpnessLevel: .yellow, sharpnessValue: 20),
                        Sharpness(sharpnessLevel: .green, sharpnessValue: 10)
                    ],
                    spoSharpness: [],
                    parents: [],
                    children: [
                        1001
                    ]
                ),
                Weapon(
                    id: 1001,
                    name: "Dark Scythe'",
                    description: "A sickle shaped death Scythe that can cut a wyvern in two. Treated material.",
                    entityType: .weapon,
                    rarity: 3,
                    type: .longSword,
                    attack: 624,
                    attribute: [],
                    affinity: -10,
                    slots: 0,
                    defense: 0,
                    regSharpness: [
                        Sharpness(sharpnessLevel: .red, sharpnessValue: 30),
                        Sharpness(sharpnessLevel: .orange, sharpnessValue: 30),
                        Sharpness(sharpnessLevel: .yellow, sharpnessValue: 20),
                        Sharpness(sharpnessLevel: .green, sharpnessValue: 20)
                    ],
                    spoSharpness: [],
                    parents: [
                        1001
                    ],
                    children: [
                        1002
                    ]
                )
            ]
        )
    }
}
