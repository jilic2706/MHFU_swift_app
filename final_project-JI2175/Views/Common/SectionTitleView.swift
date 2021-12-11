//
//  SectionLabelView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 12.12.2021..
//

import SwiftUI

struct SectionTitleView: View {
    var sectionLabel: String
    
    var body: some View {
        Text(sectionLabel.uppercased())
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("ModeDependantLabel"))
            .padding()
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .background(Color("ModeDependantGray"))
    }
}

struct SectionTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleView(sectionLabel: "Example")
    }
}
