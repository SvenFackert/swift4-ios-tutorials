//
//  InvitationEntity+CoreDataProperties.swift
//  Delegates
//
//  Created by Daniel Lauer on 11/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import Foundation
import CoreData


extension InvitationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InvitationEntity> {
        return NSFetchRequest<InvitationEntity>(entityName: "InvitationEntity");
    }

    @NSManaged public var invited: Bool
    @NSManaged public var invitedFriends: NSSet?

}

// MARK: Generated accessors for invitedFriends
extension InvitationEntity {

    @objc(addInvitedFriendsObject:)
    @NSManaged public func addToInvitedFriends(_ value: FriendEntity)

    @objc(removeInvitedFriendsObject:)
    @NSManaged public func removeFromInvitedFriends(_ value: FriendEntity)

    @objc(addInvitedFriends:)
    @NSManaged public func addToInvitedFriends(_ values: NSSet)

    @objc(removeInvitedFriends:)
    @NSManaged public func removeFromInvitedFriends(_ values: NSSet)

}
