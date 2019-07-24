//
//  Player+CoreDataProperties.swift
//  RelationalDeleteRule
//
//  Created by ankit bharti on 24/07/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var playersScore: NSOrderedSet?

}

// MARK: Generated accessors for playersScore
extension Player {

    @objc(insertObject:inPlayersScoreAtIndex:)
    @NSManaged public func insertIntoPlayersScore(_ value: Scores, at idx: Int)

    @objc(removeObjectFromPlayersScoreAtIndex:)
    @NSManaged public func removeFromPlayersScore(at idx: Int)

    @objc(insertPlayersScore:atIndexes:)
    @NSManaged public func insertIntoPlayersScore(_ values: [Scores], at indexes: NSIndexSet)

    @objc(removePlayersScoreAtIndexes:)
    @NSManaged public func removeFromPlayersScore(at indexes: NSIndexSet)

    @objc(replaceObjectInPlayersScoreAtIndex:withObject:)
    @NSManaged public func replacePlayersScore(at idx: Int, with value: Scores)

    @objc(replacePlayersScoreAtIndexes:withPlayersScore:)
    @NSManaged public func replacePlayersScore(at indexes: NSIndexSet, with values: [Scores])

    @objc(addPlayersScoreObject:)
    @NSManaged public func addToPlayersScore(_ value: Scores)

    @objc(removePlayersScoreObject:)
    @NSManaged public func removeFromPlayersScore(_ value: Scores)

    @objc(addPlayersScore:)
    @NSManaged public func addToPlayersScore(_ values: NSOrderedSet)

    @objc(removePlayersScore:)
    @NSManaged public func removeFromPlayersScore(_ values: NSOrderedSet)

}
