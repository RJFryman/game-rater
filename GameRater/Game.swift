//
//  Game.swift
//  
//
//  Created by Robert Fryman on 7/5/15.
//
//

import Foundation
import CoreData

@objc(Game)
class Game: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var rating: String
    @NSManaged var type: String

}
