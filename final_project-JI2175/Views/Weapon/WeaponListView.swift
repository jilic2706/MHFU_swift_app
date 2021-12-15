//
//  WeaponListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct WeaponListView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var appropriateWeapons: [Weapon]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(appropriateWeapons) { weapon in
                    if(weapon.parents.isEmpty) {
                        WeaponTreeView(bookmarksViewModel: bookmarksViewModel, weapon: weapon, offset: 0, appropriateWeapons: appropriateWeapons)
                    }
                }
            }
        }
            .navigationBarTitle(appropriateWeapons[0].type.description, displayMode: .inline)
    }
}

struct WeaponListView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponListView(bookmarksViewModel: BookmarksViewModel(), appropriateWeapons: WeaponProvider.shared.weapons)
    }
}
