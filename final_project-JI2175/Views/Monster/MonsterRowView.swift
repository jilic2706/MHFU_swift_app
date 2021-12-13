//
//  MonsterRowView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import SwiftUI
import Kingfisher

struct MonsterRowView: View {
    @ObservedObject var bookmarkViewModel: EntityViewModel
    
    var monster: Monster
    var locations: [Location]
    
    var body: some View {
        NavigationLink(
            destination: MonsterDetailView(bookmarkViewModel: bookmarkViewModel, monster: monster, locations: locations)) {
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    HStack(spacing: 14) {
                        KFImage(monster.icon)
                            .resizable()
                            .frame(width: 70, height: 70)
                        VStack(alignment: .leading, spacing: 7) {
                            Text(monster.name)
                                .font(.headline)
                            Text(monster.type.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MonsterRowView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterRowView(bookmarkViewModel: EntityViewModel(), monster: Monster(id: 81, name: "Espinas", description: "???", entityType: .monster, type: .flyingWyvern, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/a/ad/FrontierGen-Espinas_Icon.png/revision/latest?cb=20160325035149"), habitats: [806, 814, 816]), locations: [Location(id: 8001, name: "Snowy Mountains", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/1/1e/FieldIcon01.png/revision/latest?cb=20100610145108"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/f/f8/MH2-Snowy_Mountains_Map.png/revision/latest?cb=20150919000312"], inhabitants: [0]), Location(id: 8002, name: "Jungle", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/6/69/FieldIcon16.png/revision/latest?cb=20100610145322"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/d/da/MH2-Jungle_Day_Map.png/revision/latest?cb=20150919000312"], inhabitants: [0])])
    }
}
