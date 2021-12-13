//
//  SIdeMenu.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct SideMenu: View {
    @Binding var selection: Int
    
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
                .background(Color.gray.opacity(0.5))
                .opacity(self.menuOpened ? 1 : 0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    self.toggleMenu()
                }
            HStack {
                MenuContent(selection: $selection, toggleMenu: toggleMenu)
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu()
//    }
//}
