//
//  OOBView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

import SwiftUI
import Kingfisher


// Out-Of-Bounds view. Used as a landing view for out-of-bound selections and incomplete views.
struct OOBView: View {
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                KFImage(URL(string: "https://pbs.twimg.com/media/FGdSKbNWQAEjraT?format=jpg&name=900x900"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack(spacing: 70) {
                    ForEach(0..<2) { rep in
                        Button(
                            action: {
                                self.selection = 0
                            },
                            label: {
                                Text("Sorry.")
                                    .font(.body)
                                    .fontWeight(.heavy)
                            }
                        )
                            .padding(21)
                            .background((rep == 0) ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(35)
                    }
                }
                Spacer()
            }
        }
            .navigationBarHidden(true)
    }
}

struct OOBView_Previews: PreviewProvider {
    static var previews: some View {
        OOBView(selection: .constant(0))
    }
}
