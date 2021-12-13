//
//  LocationRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 10.12.2021..
//

import SwiftUI
import Kingfisher

struct LocationRowView: View {
    @ObservedObject var bookmarkViewModel: EntityViewModel
    
    var location: Location
    
    var body: some View {
        NavigationLink(
            destination: LocationDetailView(bookmarkViewModel: bookmarkViewModel, location: location)) {
            VStack(spacing: 0) {
                ZStack {
                    HStack(spacing: 14) {
                        KFImage(location.icon)
                            .resizable()
                            .frame(width: 70, height: 70)
                        Text(location.name)
                            .font(.headline)
                    }
                }
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct LocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRowView(bookmarkViewModel: EntityViewModel(), location: Location(id: 8001, name: "Snowy Mountains", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/1/1e/FieldIcon01.png/revision/latest?cb=20100610145108"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/f/f8/MH2-Snowy_Mountains_Map.png/revision/latest?cb=20150919000312"], inhabitants: [0]))
    }
}
