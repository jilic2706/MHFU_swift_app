//
//  OOBView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct OOBView: View {
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("How'd you get here?")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.purple)
            Spacer()
        }
            .navigationBarTitle("What?")
            .navigationBarTitleDisplayMode(.large)
            .onTapGesture {
                self.selection = 0
            }
    }
}

struct OOBView_Previews: PreviewProvider {
    static var previews: some View {
        OOBView(selection: .constant(0))
    }
}
