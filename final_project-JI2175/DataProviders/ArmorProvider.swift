//
//  ArmorProvider.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import Foundation

class ArmorProvider {
    static let shared = ArmorProvider()
    
    private(set) var armorSet: ArmorSet
    
    init() {
        armorSet = ArmorSet(
            id: 1,
            name: "Silver Sol Z",
            description: "",
            entityType: .armor,
            rarity: 10,
            armorPieces: [
                ArmorPiece(
                    name: "Silver Sol Helm Z",
                    description: "Silver Rathalos Helm. Metal brilliant as ice, violent power like a raging inferno.",
                    type: .head,
                    physicalDefense: 98,
                    fireDefense: 2,
                    waterDefense: -1,
                    thunderDefense: -1,
                    iceDefense: 0,
                    dragonDefense: 1,
                    slots: 2,
                    skillPoints: [
                        SkillPoint(skillId: 6014, skillQuantity: 3),
                        SkillPoint(skillId: 6001, skillQuantity: 4),
                        SkillPoint(skillId: 6002, skillQuantity: -2)
                    ],
                    craftingCost: 24500
                ),
                ArmorPiece(
                    name: "Silver Sol Mail Z",
                    description: "Radiates with a Silver Sun's frozen flames. Freezes attacks before they land.",
                    type: .torso,
                    physicalDefense: 98,
                    fireDefense: 2,
                    waterDefense: -1,
                    thunderDefense: -1,
                    iceDefense: 0,
                    dragonDefense: 1,
                    slots: 2,
                    skillPoints: [
                        SkillPoint(skillId: 6014, skillQuantity: 2),
                        SkillPoint(skillId: 6001, skillQuantity: 3),
                        SkillPoint(skillId: 6002, skillQuantity: -2)
                    ],
                    craftingCost: 24500
                ),
                ArmorPiece(
                    name: "Silver Sol Vambraces Z",
                    description: "Contains the soul of a Silver Rathalos, who roams the skies like lightning.",
                    type: .arms,
                    physicalDefense: 98,
                    fireDefense: 2,
                    waterDefense: -1,
                    thunderDefense: -1,
                    iceDefense: 0,
                    dragonDefense: 1,
                    slots: 2,
                    skillPoints: [
                        SkillPoint(skillId: 6014, skillQuantity: 3),
                        SkillPoint(skillId: 6001, skillQuantity: 4),
                        SkillPoint(skillId: 6002, skillQuantity: -2)
                    ],
                    craftingCost: 24500
                ),
                ArmorPiece(
                    name: "Silver Sol Coil Z",
                    description: "Completely and utterly flawless. There are no other words to describe this.",
                    type: .waist,
                    physicalDefense: 98,
                    fireDefense: 2,
                    waterDefense: -1,
                    thunderDefense: -1,
                    iceDefense: 0,
                    dragonDefense: 1,
                    slots: 3,
                    skillPoints: [
                        SkillPoint(skillId: 6014, skillQuantity: 1),
                        SkillPoint(skillId: 6001, skillQuantity: 3),
                        SkillPoint(skillId: 6002, skillQuantity: -3)
                    ],
                    craftingCost: 24500
                ),
                ArmorPiece(
                    name: "Silver Sol Greaves Z",
                    description: "Elegant greaves tinged with a never-ending glow like the afterglow of a miracle.",
                    type: .feet,
                    physicalDefense: 98,
                    fireDefense: 2,
                    waterDefense: -1,
                    thunderDefense: -1,
                    iceDefense: 0,
                    dragonDefense: 1,
                    slots: 3,
                    skillPoints: [
                        SkillPoint(skillId: 6014, skillQuantity: 1),
                        SkillPoint(skillId: 6001, skillQuantity: 3),
                        SkillPoint(skillId: 6002, skillQuantity: -3)
                    ],
                    craftingCost: 24500
                )
            ]
        )
    }
}
