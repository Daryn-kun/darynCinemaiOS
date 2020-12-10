//
//  Movies.swift
//  DarynCinema
//
//  Created by nagato on 12/8/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import Foundation
import RealmSwift

class Movies: Object{
    @objc dynamic var id = 0
    @objc dynamic var movieTitle: String?
    @objc dynamic var imgUrl: String?
    @objc dynamic var imdbId = 0
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
