//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Michael Overman on 8/11/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var photoID: String?
    @NSManaged public var title: String?
    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var remoteURL: NSObject?

}
