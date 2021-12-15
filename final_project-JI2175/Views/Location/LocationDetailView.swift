//
//  LocationDetailView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 10.12.2021..
//

import SwiftUI
import Kingfisher

struct LocationDetailView: View {
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var location: Location
    
    var locationMaps: [URL] {
        var mapURLs: [URL] = []
        let mapStrings = location.map
        mapStrings?.forEach { mapString in
            mapURLs.append(URL(string: mapString)!)
        }
        return mapURLs
    }
    
    var isBookmarked: String {
        if(bookmarksViewModel.entityAlreadyBookmarked(entity: location)) {
            return "bookmark.fill"
        } else {
            return "bookmark"
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 21) {
            Spacer()
            if(locationMaps.count < 2) {
                KFImage(locationMaps[0])
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
            } else {
                TabView {
                    HStack(alignment: .center, spacing: 0) {
                        KFImage(locationMaps[0])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
                        Image(systemName: "chevron.right")
                    }
                    HStack(alignment: .center, spacing: 0) {
                        Image(systemName: "chevron.left")
                        KFImage(locationMaps[1])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
                    }
                }.tabViewStyle(PageTabViewStyle())
            }
            Spacer()
        }
            .navigationBarTitle(location.name, displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarTrailing,
                    content: {
                        Button(
                            action: {
                                bookmarksViewModel.toggleBookmark(entity: location)
                            },
                            label: {
                                Image(systemName: isBookmarked)
                            }
                        )
                    }
                )
            }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(bookmarksViewModel: BookmarksViewModel(), location: Location(id: 8001, name: "Snowy Mountains", description: "", entityType: .location, icon: URL(string: "https://static.wikia.nocookie.net/monsterhunter/images/1/1e/FieldIcon01.png/revision/latest?cb=20100610145108"), map: ["https://static.wikia.nocookie.net/monsterhunter/images/4/48/MHFU-Tower_Base_Map.png/revision/latest/scale-to-width-down/153?cb=20150911045103",
            "https://static.wikia.nocookie.net/monsterhunter/images/a/a6/MHFU-Tower_1_Map.png/revision/latest/scale-to-width-down/183?cb=20150911045132"], inhabitants: [0]))
    }
}
