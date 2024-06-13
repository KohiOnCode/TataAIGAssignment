//
//  CDList+CoreDataProperties.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//
//

import Foundation
import CoreData


extension CDList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDList> {
        return NSFetchRequest<CDList>(entityName: "CDList")
    }

    @NSManaged public var listImage: String?
    @NSManaged public var listTitle: String?

}

extension CDList : Identifiable {

}
