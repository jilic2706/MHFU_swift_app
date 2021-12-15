//
//  WeaponProvider.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import Foundation

class WeaponProvider {
    static let shared = WeaponProvider()
    
    private(set) var weapons: [Weapon] = []
    
    init() {
        weapons = [
            Weapon(
                id: 1000,
                name: "Iron Katana 'Grace'",
                description: "Made with technology from the Orient. A strong Sword, but requires maintenance.",
                entityType: .weapon,
                rarity: 2,
                type: .longSword,
                attack: 528,
                attribute: [],
                affinity: 0,
                slots: 0,
                defense: 0,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [],
                children: [
                    1001
                ]
            ),
            Weapon(
                id: 1001,
                name: "Dark Scythe",
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
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .m),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [
                    1000
                ],
                children: [
                    1002,
                    1003
                ]
            ),
            Weapon(
                id: 1002,
                name: "Tormentor",
                description: "A sickle shaped death Scythe that can cut a wyvern in two. Treated material.",
                entityType: .weapon,
                rarity: 4,
                type: .longSword,
                attack: 960,
                attribute: [],
                affinity: -10,
                slots: 0,
                defense: 0,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .m),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .m),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .m)
                ],
                parents: [
                    1001
                ],
                children: [
                    1004,
                    1005
                ]
            ),
            Weapon(
                id: 1003,
                name: "Crimson Scythe",
                description: "Scythe made from the pride of a Monoblos, its blood red horn. Never breaks twice.",
                entityType: .weapon,
                rarity: 3,
                type: .longSword,
                attack: 624,
                attribute: [
                    WeaponAttribute(attributeType: .fire, attributeValue: 120)
                ],
                affinity: -10,
                slots: 0,
                defense: 0,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .lg),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [
                    1001
                ],
                children: [
                    1006,
                    1007
                ]
            ),
            Weapon(
                id: 1004,
                name: "Scythe of Menace",
                description: "Scythe made from the pride of a Monoblos, its blood red horn. Never breaks twice.",
                entityType: .weapon,
                rarity: 6,
                type: .longSword,
                attack: 960,
                attribute: [
                    WeaponAttribute(attributeType: .poison, attributeValue: 320)
                ],
                affinity: -10,
                slots: 0,
                defense: 0,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .m),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .blue, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [
                    1002
                ],
                children: [
                    
                ]
            ),
            Weapon(
                id: 1005,
                name: "Crab Cutter",
                description: "Splendid Scythe made from a Daimyo's claw. The giant claw's gap devours meat.",
                entityType: .weapon,
                rarity: 6,
                type: .longSword,
                attack: 864,
                attribute: [],
                affinity: 0,
                slots: 1,
                defense: 28,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .m),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .m),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [
                    1002
                ],
                children: [
                    
                ]
            ),
            Weapon(
                id: 1006,
                name: "Monoblos Scythe",
                description: "Splendid Scythe made from a Daimyo's claw. The giant claw's gap devours meat.",
                entityType: .weapon,
                rarity: 4,
                type: .longSword,
                attack: 768,
                attribute: [
                    WeaponAttribute(attributeType: .fire, attributeValue: 180)
                ],
                affinity: 0,
                slots: 0,
                defense: 28,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .xs),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .m),
                    Sharpness(sharpnessType: .green, sharpnessValue: .m)
                ],
                spoSharpness: [],
                parents: [
                    1003
                ],
                children: [
                    
                ]
            ),
            Weapon(
                id: 1007,
                name: "White Mantis",
                description: "White Scythe made with a silver horn. It glitters like a new moon.",
                entityType: .weapon,
                rarity: 4,
                type: .longSword,
                attack: 672,
                attribute: [
                    WeaponAttribute(attributeType: .water, attributeValue: 210)
                ],
                affinity: 0,
                slots: 0,
                defense: 28,
                regSharpness: [
                    Sharpness(sharpnessType: .red, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .orange, sharpnessValue: .xs),
                    Sharpness(sharpnessType: .yellow, sharpnessValue: .sm),
                    Sharpness(sharpnessType: .green, sharpnessValue: .sm)
                ],
                spoSharpness: [],
                parents: [
                    1003
                ],
                children: [
                    
                ]
            )
        ]
    }
}
