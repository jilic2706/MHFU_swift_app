//
//  Location.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 08.12.2021..
//

import Foundation

class Location: Entity {
    var icon: URL?
    var map: [String]?
    var inhabitants: [Int]?
    //var resources: [Item]
    
    enum CodingKeys: String, CodingKey {
        case icon
        case map
        case inhabitants
        //case resources
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try values.decode(URL.self, forKey: .icon)
        map = try values.decode([String].self, forKey: .map)
        inhabitants = try values.decode([Int].self, forKey: .inhabitants)
        //resources = try values.decode([Item].self, forKey: .resources)
        try super.init(from: decoder)
    }
    
    init(id: Int, name: String, description: String?, entityType: EntityType, icon: URL?, map: [String]?, inhabitants: [Int]?) {
        self.icon = icon
        self.map = map
        self.inhabitants = inhabitants
        //self.resources = resources
        super.init(id: id, name: name, description: description, entityType: entityType)
    }
}
