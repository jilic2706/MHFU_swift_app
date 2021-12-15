//
//  MenuContent.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct MenuContent: View {
    @Binding var selection: Int
    
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            Color(.white)
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                ForEach(MenuViewModel.allCases, id: \.self) { menuItem in
                    if(menuItem.menuSelection == 8) {
                        VStack(alignment: .leading) {
                            Divider()
                                .background(Color("ModeDependantGray"))
                                .padding(.vertical, 21)
                            Text("OTHER")
                                .font(.caption)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black.opacity(0.5))
                                .padding(.bottom, 14)
                                .padding(.leading, 21)
                        }
                    }
                    HStack(spacing: 35) {
                        Image(menuItem.menuItemIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35, alignment: .center)
                            .opacity((selection == menuItem.menuSelection) ? 1 : 0.7)
                        Text(menuItem.menuItemText)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor((selection == menuItem.menuSelection) ? Color.white : Color.black.opacity(0.7))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                        .onTapGesture {
                            self.selection = menuItem.menuSelection
                            self.toggleMenu()
                        }
                        .padding(.vertical, 7)
                        .padding(.horizontal, 21)
                        .background((selection == menuItem.menuSelection) ? Color.green : Color(.white))
                }
            }
            .padding(.top, 15)
        }
    }
}

func printSomething() {
    print("X")
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent(selection: .constant(0), toggleMenu: printSomething)
    }
}
