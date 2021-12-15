//
//  LocationListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 10.12.2021..
//

import SwiftUI

struct LocationListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    @ObservedObject var viewModel: LocationsViewModel
    
    var locations: [Location] {
        return viewModel.data
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(locations) { location in
                    LocationRowView(bookmarksViewModel: bookmarksViewModel, location: location)
                        .padding(.horizontal)
                    Divider()
                        .background(Color("ModeDependantGray"))
                }
            }
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(menuOpened: .constant(false), bookmarksViewModel: BookmarksViewModel(), viewModel: LocationsViewModel())
    }
}
