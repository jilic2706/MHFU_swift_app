//
//  TitleNavBarItems.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI
import PagerTabStripView

private class NavBarItemWithTextTheme: ObservableObject {
    @Published var textColor = Color.gray
}

private class NavBarItemWithImageTheme: ObservableObject {
    @Published var opacity = 0.5
}

struct TitleNavBarItemWithText: View, PagerTabViewDelegate {
    let title: String
    @ObservedObject fileprivate var theme = NavBarItemWithTextTheme()

    var body: some View {
        HStack {
            Spacer()
            Text(title.uppercased())
                .foregroundColor(theme.textColor)
                .font(.subheadline)
            Spacer()
        }
        .background(Color("ModeDependantLabel"))
    }
    
    func setState(state: PagerTabViewState) {
        switch state {
        case .selected:
            self.theme.textColor = Color(.label)
        case .highlighted:
            self.theme.textColor = Color.pink
        default:
            self.theme.textColor = Color.gray
        }
    }
}

struct TitleNavBarItemWithImage: View, PagerTabViewDelegate {
    let imageName: String
    @ObservedObject fileprivate var theme = NavBarItemWithImageTheme()
    
    var body: some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 21, height: 21)
                .opacity(theme.opacity)
            Spacer()
        }
        .background(Color("ModeDependantLabel"))
    }
    
    func setState(state: PagerTabViewState) {
        switch state {
        case .selected:
            self.theme.opacity = 1
        case .highlighted:
            self.theme.opacity = 0.7
        default:
            self.theme.opacity = 0.5
        }
    }
}
