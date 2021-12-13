//
//  DefenseRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI

struct ResistanceRowView: View {
    var resistanceType: String
    var resistanceNumber: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("\(resistanceType)")
                    .font(.subheadline)
                Spacer()
                Text("\(resistanceNumber)")
                    .font(.subheadline)
            }
                .padding(.horizontal)
        }
    }
}

struct DefenseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ResistanceRowView(resistanceType: "Physical", resistanceNumber: 50)
    }
}
