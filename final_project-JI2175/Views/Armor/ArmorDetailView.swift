//
//  ArmorDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI
import PagerTabStripView

struct ArmorDetailView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    @State var selection = 0
    
    var armorSet: ArmorSet
    var allSkills: [Skill]
    
    var rarityColor: String {
        switch armorSet.rarity {
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
    
    var isBookmarked: String {
        if(bookmarksViewModel.entityAlreadyBookmarked(entity: armorSet)) {
            return "bookmark.fill"
        } else {
            return "bookmark"
        }
    }
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
            ArmorSetView(armorSet: armorSet, allSkills: allSkills, rarityColor: rarityColor)
                .pagerTabItem {
                    TitleNavBarItemWithText(title: "Set")
                }
            ForEach(armorSet.armorPieces, id: \.self) { armorPiece in
                ArmorPieceView(armorPiece: armorPiece, allSkills: allSkills, rarity: armorSet.rarity)
                    .pagerTabItem {
                        TitleNavBarItemWithImage(imageName: "\(armorPiece.type.description)-rarity-1")
                    }
            }
        }
            .navigationBarTitle(armorSet.name, displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarTrailing,
                    content: {
                        Button(
                            action: {
                                bookmarksViewModel.toggleBookmark(entity: armorSet)
                            },
                            label: {
                                Image(systemName: isBookmarked)
                            }
                        )
                    }
                )
            }
    }
}

struct ArmorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorDetailView(bookmarksViewModel: BookmarksViewModel(), armorSet: ArmorProvider.shared.armorSet, allSkills: SkillProvider.shared.skills)
    }
}
