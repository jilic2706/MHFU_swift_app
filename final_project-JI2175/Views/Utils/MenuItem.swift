//
//  MenuItem.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct MenuItem: View {
    var iconName: String
    var label: String
    
    var body: some View {
        Button(
            action: {
                
            },
            label: {
                Image(iconName)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.horizontal)
                Text(label)
                    .font(.body)
            }
        )
            .buttonStyle(PlainButtonStyle())
            .padding(.vertical, 7)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(iconName: "location", label: "Locations")
    }
}
