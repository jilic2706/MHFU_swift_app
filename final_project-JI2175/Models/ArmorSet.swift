//
//  ArmorSet.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

struct ArmorSet: Codable {
    var armorPieces: [ArmorPiece]
    
    var totalPhysicalDefense: Int {
        var physicalDefense: Int = 0
        for armorPiece in armorPieces {
            physicalDefense += armorPiece.physicalDefense
        }
        return physicalDefense
    }
    
    var totalFireDefense: Int {
        var fireDefense: Int = 0
        for armorPiece in armorPieces {
            fireDefense += armorPiece.fireDefense
        }
        return fireDefense
    }
    
    var totalWaterDefense: Int {
        var waterDefense: Int = 0
        for armorPiece in armorPieces {
            waterDefense += armorPiece.waterDefense
        }
        return waterDefense
    }
    
    var totalThunderDefense: Int {
        var thunderDefense: Int = 0
        for armorPiece in armorPieces {
            thunderDefense += armorPiece.thunderDefense
        }
        return thunderDefense
    }
    
    var totalIceDefense: Int {
        var iceDefense: Int = 0
        for armorPiece in armorPieces {
            iceDefense += armorPiece.iceDefense
        }
        return iceDefense
    }
    
    var totalDragonDefense: Int {
        var dragonDefense: Int = 0
        for armorPiece in armorPieces {
            dragonDefense += armorPiece.dragonDefense
        }
        return dragonDefense
    }
    
    var totalSlots: Int {
        var slots: Int = 0
        for armorPiece in armorPieces {
            slots += armorPiece.slots
        }
        return slots
    }
    
    var totalSkillPoints: [SkillPoint]? {
        var skillPoints: [SkillPoint] = []
        for armorPiece in armorPieces {
            let armorPieceSkillPoints = armorPiece.skillPoints
            for armorPieceSkillPoint in armorPieceSkillPoints {
                if !skillPoints.contains(where: { $0.skillId == armorPieceSkillPoint.skillId }) {
                    skillPoints.append(armorPieceSkillPoint)
                } else {
                    guard let existingSkillPointIndex = skillPoints.firstIndex(where: { $0.skillId == armorPieceSkillPoint.skillId }) else { return nil }
                    skillPoints[existingSkillPointIndex].skillQuantity += armorPieceSkillPoint.skillQuantity
                }
            }
        }
        return skillPoints
    }

    var totalCraftingMaterials: [Material]? {
        var craftingMaterials: [Material] = []
        for armorPiece in armorPieces {
            let armorPieceCraftingMaterials = armorPiece.craftingMaterials
            for armorPieceCraftingMaterial in armorPieceCraftingMaterials {
                if !craftingMaterials.contains(where: { $0.itemId == armorPieceCraftingMaterial.itemId }) {
                    craftingMaterials.append(armorPieceCraftingMaterial)
                } else {
                    guard let existingCraftingMaterialIndex = craftingMaterials.firstIndex(where: { $0.itemId == armorPieceCraftingMaterial.itemId }) else { return nil }
                    craftingMaterials[existingCraftingMaterialIndex].itemQuantity += armorPieceCraftingMaterial.itemQuantity
                }
            }
        }
        return craftingMaterials
    }
    
    var totalCraftingCost: Int {
        var craftingCost: Int = 0
        for armorPiece in armorPieces {
            craftingCost += armorPiece.craftingCost
        }
        return craftingCost
    }
}
