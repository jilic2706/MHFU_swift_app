//
//  WeaponTypeListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 15.12.2021..
//

import SwiftUI

struct WeaponTypeListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    @ObservedObject var weaponsViewModel: WeaponsViewModel
    
    var allWeapons: [Weapon] {
        return weaponsViewModel.data
    }
    
    func getAvailableWeaponTypes(weapons: [Weapon]) -> [WeaponType] {
        var availableWeaponTypes: [WeaponType] = []
        for weapon in weapons {
            let weaponType = weapon.type
            if(!availableWeaponTypes.contains(weaponType)) {
                availableWeaponTypes.append(weaponType)
            } else {
                continue
            }
        }
        let sortedAvailableWeaponTypes = availableWeaponTypes.sorted(by: { $0.rawValue < $1.rawValue })
        return sortedAvailableWeaponTypes
    }
    
    func getAppropriateWeapons(weaponType: WeaponType, weapons: [Weapon]) -> [Weapon] {
        return weapons.filter {
            $0.type == weaponType
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(getAvailableWeaponTypes(weapons: allWeapons), id: \.self) { weaponType in
                    NavigationLink(destination: WeaponListView(bookmarksViewModel: bookmarksViewModel, appropriateWeapons: getAppropriateWeapons(weaponType: weaponType, weapons: allWeapons))) {
                        HStack {
                            VStack(alignment: .leading, spacing: 3.5) {
                                Text(weaponType.description)
                                    .font(.headline)
                                    .foregroundColor(Color(.label))
                            }
                            Spacer()
                        }
                            .padding()
                    }
                    Divider()
                        .background(Color("ModeDependantGray"))
                }
            }
        }
        .navigationBarTitle("Weapons", displayMode: .inline)
        .toolbar {
            ToolbarItem(
                placement: ToolbarItemPlacement.navigationBarLeading,
                content: {
                    Button(
                        action: {
                            self.menuOpened.toggle()
                        },
                        label: {
                            Image(systemName: "list.dash")
                        }
                    )
                }
            )
        }
    }
}

struct WeaponTypeListView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponTypeListView(menuOpened: .constant(false), bookmarksViewModel: BookmarksViewModel(), weaponsViewModel: WeaponsViewModel())
    }
}
