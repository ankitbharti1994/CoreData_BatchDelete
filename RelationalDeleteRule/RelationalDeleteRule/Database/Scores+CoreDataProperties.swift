//
//  Scores+CoreDataProperties.swift
//  RelationalDeleteRule
//
//  Created by ankit bharti on 24/07/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//
//

import Foundation
import CoreData


extension Scores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scores> {
        return NSFetchRequest<Scores>(entityName: "Scores")
    }

    @NSManaged public var run: Int32
    @NSManaged public var players: Player?

}
