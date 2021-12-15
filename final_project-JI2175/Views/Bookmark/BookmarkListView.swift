//
//  BookmarkListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 14.12.2021..
//

import SwiftUI

struct BookmarkListView: View {
    @Binding var menuOpened: Bool
    
    @ObservedObject var bookmarksViewModel: BookmarksViewModel
    
    var allSkills: [Skill]
    var allLocations: [Location]
    
    var bookmarks: [Entity] {
        return bookmarksViewModel.bookmarks
    }
    
    var body: some View {
        if(bookmarks.isEmpty) {
            VStack {
                Text("Nothing's been bookmarked yet.")
                    .font(.title3)
                Text("Get to it!")
                    .font(.title)
            }
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(bookmarks) { bookmark in
                        BookmarkRowView(bookmarksViewModel: bookmarksViewModel, entity: bookmark, allSkills: allSkills, allLocations: allLocations)
                    }
                }
            }
        }
    }
}

struct BookmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkListView(menuOpened: .constant(false), bookmarksViewModel: BookmarksViewModel(), allSkills: SkillsViewModel().data, allLocations: LocationsViewModel().data)
    }
}
