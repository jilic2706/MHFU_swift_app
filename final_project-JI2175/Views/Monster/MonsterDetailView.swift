//
//  MonsterDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 09.12.2021..
//

import SwiftUI
import Kingfisher

struct MonsterDetailView: View {
    @ObservedObject var bookmarkViewModel: EntityViewModel
    
    var monster: Monster
    var locations: [Location]
    
    var monsterLocations: [Location] {
        var monsterLocations: [Location] = []
        monster.habitats.forEach { habitatId in
            locations.forEach { location in
                if(location.id == habitatId) {
                    monsterLocations.append(location)
                }
            }
        }
        return monsterLocations
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                VStack(alignment: .center) {
                    VStack(spacing: 14) {
                        Text(monster.type.description)
                            .font(.subheadline)
                            .foregroundColor(Color("ModeDependantGray"))
                        Text(monster.name)
                            .font(.title)
                    }
                        .padding(EdgeInsets(top: 21, leading: 0, bottom: 0, trailing: 0))
                    Divider()
                        .background(Color("ModeDependantGray"))
                    KFImage(monster.icon)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
                        .padding()
                    Divider()
                        .background(Color("ModeDependantGray"))
                }
                Text(monster.description ?? "???")
                    .font(.body)
                    .padding()
                SectionTitleView(sectionLabel: "Habitats")
                    .foregroundColor(.white)
                LazyVStack(alignment: .leading) {
                    ForEach(monsterLocations) { monsterLocation in
                        LocationRowView(bookmarkViewModel: EntityViewModel(), location: monsterLocation)
                            .padding(.horizontal)
                        Divider()
                            .background(Color("ModeDependantGray"))
                    }
                }
            }
        }
            .navigationBarTitle(monster.name, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            bookmarkViewModel.toggleBookmark(entity: monster as Monster)
                        },
                        label: {
                            Image(systemName: "bookmark")
                        }
                    )
            )
    }
}

struct MonsterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetailView(bookmarkViewModel: EntityViewModel(), monster: Monster(id: 75, name: "Teostra", description: "A brutal male Elder Dragon with breath of flame and expert control over fire. Its vile temperament means anyone who approaches is subject to fire and brimstone. Known to attack towns, the Guild keeps tabs on its movements.", entityType: .monster, type: .elderDragon, size: .large, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/4/4b/FrontierGen-Teostra_Icon.png/revision/latest/scale-to-width-down/70?cb=20160325041246"), habitats: [8001, 8002]), locations: [Location(id: 8001, name: "Snowy Mountains", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/1/1e/FieldIcon01.png/revision/latest?cb=20100610145108"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/f/f8/MH2-Snowy_Mountains_Map.png/revision/latest?cb=20150919000312"], inhabitants: [0]), Location(id: 8002, name: "Jungle", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/6/69/FieldIcon16.png/revision/latest?cb=20100610145322"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/d/da/MH2-Jungle_Day_Map.png/revision/latest?cb=20150919000312"], inhabitants: [0])])
            .preferredColorScheme(.light)
    }
}
