//
//  FriendEntity+CoreDataProperties.swift
//  Delegates
//
//  Created by Daniel Lauer on 11/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import Foundation
import CoreData


extension FriendEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendEntity> {
        return NSFetchRequest<FriendEntity>(entityName: "FriendEntity");
    }

    @NSManaged public var imageName: String
    @NSManaged public var name: String
}
