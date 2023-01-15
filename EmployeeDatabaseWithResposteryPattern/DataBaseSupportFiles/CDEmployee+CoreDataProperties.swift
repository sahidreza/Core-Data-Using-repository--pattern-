//
//  CDEmployee+CoreDataProperties.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var emailID: String
    @NSManaged public var address: String

}

extension CDEmployee : Identifiable {

}
