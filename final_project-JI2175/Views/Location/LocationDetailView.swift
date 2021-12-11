//
//  LocationDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 10.12.2021..
//

import SwiftUI
import Kingfisher

struct LocationDetailView: View {
    var location: Location
    
    var locationMaps: [URL] {
        var mapURLs: [URL] = []
        let mapStrings = location.map
        mapStrings?.forEach { mapString in
            mapURLs.append(URL(string: mapString)!)
        }
        return mapURLs
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack(alignment: .center) {
                Text(location.name)
                    .font(Font.title.smallCaps())
                    .fontWeight(.heavy)
            }
                .padding(EdgeInsets(top: 21, leading: 0, bottom: 0, trailing: 0))
            VStack(alignment: .leading, spacing: 21) {
                Spacer()
                if(locationMaps.count < 2) {
                    KFImage(locationMaps[0])
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
                } else {
                    TabView {
                        KFImage(locationMaps[0])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
                        KFImage(locationMaps[1])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
                    }.tabViewStyle(PageTabViewStyle())
                    .frame(height: UIScreen.main.bounds.height * 0.45)
                }
                Spacer()
            }
        }
            .navigationBarTitle(location.name, displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "list.dash")
                        }
                    ),
                trailing:
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "magnifyingglass.circle")
                        }
                    )
            )
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location(id: 8001, name: "Snowy Mountains", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/1/1e/FieldIcon01.png/revision/latest?cb=20100610145108"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/4/48/MHFU-Tower_Base_Map.png/revision/latest/scale-to-width-down/153?cb=20150911045103",
            "https://static.wikia.nocookie.net/monsterhunter/images/a/a6/MHFU-Tower_1_Map.png/revision/latest/scale-to-width-down/183?cb=20150911045132"], inhabitants: [0]))
    }
}
