//
//  EntityViewModel.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 13.12.2021..
//

//Used mostly for bookmarks

import Foundation
import Combine

class EntityViewModel: ObservableObject {
    @Published private(set) var bookmarks: [Entity] = []
    
    private var tempBook: [Entity] = [] {
        didSet {
            refreshBookmarks()
        }
    }
    
    func entityAlreadyBookmarked(entity: Entity) -> Bool {
        guard self.tempBook.first(where: { $0.id == entity.id }) != nil else {
            return false
        }
        return true
    }
    
    func toggleBookmark(entity: Entity) -> Bool {
        if(!entityAlreadyBookmarked(entity: entity)) {
            self.tempBook.append(entity)
            print("Entity of name: \(entity.name), type: \(entity.entityType.description), and id: \(entity.id) has been bookmarked")
            self.tempBook.forEach { bookmark in
                print("Have \(bookmark.name) of \(bookmark.entityType.description) type")
            }
            refreshBookmarks()
            return true
        } else {
            removeFromBookmarks(id: entity.id)
            return false
        }
    }
    
    func removeFromBookmarks(id: Int) {
        guard let entityIndex = self.tempBook.firstIndex(where: { $0.id == id }) else {
            return
        }
        self.tempBook.remove(at: entityIndex)
        print("Entity of id \(id) has been removed from bookmarks")
        self.tempBook.forEach { bookmark in
            print("Have \(bookmark.name) of \(bookmark.entityType.description) type")
        }
        refreshBookmarks()
    }
    
    func refreshBookmarks() {
            bookmarks = tempBook
    }
}
