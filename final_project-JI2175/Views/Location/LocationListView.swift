//
//  LocationListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 10.12.2021..
//

import SwiftUI

struct LocationListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var bookmarkViewModel: EntityViewModel
    @ObservedObject var locationsViewModel: LocationsViewModel
    
    var locations: [Location] {
        return locationsViewModel.data
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(locations) { location in
                    LocationRowView(bookmarkViewModel: bookmarkViewModel, location: location)
                        .padding(.horizontal)
                    Divider()
                        .background(Color("ModeDependantGray"))
                }
            }
        }
            .navigationBarTitle("Locations", displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarLeading,
                    content: {
                        Button(
                            action: {
                                self.menuOpened.toggle()
                            },
                            label: {
                                Image(systemName: "list.dash")
                            }
                        )
                    }
                )
            }
    }
}

//struct LocationListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationListView(menuOpened: .constant(false))
//    }
//}
