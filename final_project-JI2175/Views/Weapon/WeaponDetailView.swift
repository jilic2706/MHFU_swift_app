//
//  WeaponDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct WeaponDetailView: View {
    @ObservedObject var bookmarkViewModel: EntityViewModel
    
    var weapon: Weapon
    var allWeapons: [Weapon]
    
    var body: some View {
        VStack {
            
        }
    }
}

struct WeaponDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponDetailView(
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
