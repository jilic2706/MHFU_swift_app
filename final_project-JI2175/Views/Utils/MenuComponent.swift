//
//  MenuComponent.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct MenuComponent: View {
    var body: some View {
        Menu {
            VStack {
                ForEach(MenuViewModel.allCases, id: \.self) { menuItem in
                    MenuItem(iconName: menuItem.iconName, label: menuItem.label)
                }
            }
        } label: {
            Label(
                title: {
                    Text("Menu")
                },
                icon: {
                    Image(systemName: "list.bullet")
                }
            )
        }
    }
}

struct MenuComponent_Previews: PreviewProvider {
    static var previews: some View {
        MenuComponent()
    }
}
