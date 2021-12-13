//
//  MinimizedSlotNumber.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import SwiftUI

struct SlotNumberView: View {
    var numberOfSlots: Int
    
    var body: some View {
        HStack {
            if(numberOfSlots == 0) {
                ForEach(0 ..< 3) {_ in
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 7, height: 1)
                }
            } else if(numberOfSlots == 1) {
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 7, height: 7)
                ForEach(0 ..< 2) {_ in
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 7, height: 1)
                }
            } else if(numberOfSlots == 2) {
                ForEach(0 ..< 2) {_ in
                    Circle()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 7, height: 7)
                }
                Rectangle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 7, height: 1)
            } else {
                ForEach(0 ..< 3) {_ in
                    Circle()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 7, height: 7)
                }
            }
        }
        .frame(height: 7)
    }
}

struct MinimizedSlotNumber_Previews: PreviewProvider {
    static var previews: some View {
        SlotNumberView(numberOfSlots: 2)
    }
}
