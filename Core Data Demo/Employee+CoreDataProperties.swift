//
//  Employee+CoreDataProperties.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var project: String?
    @NSManaged public var bio: String?
    @NSManaged public var departments: NSSet?

}

// MARK: Generated accessors for departments
extension Employee {

    @objc(addDepartmentsObject:)
    @NSManaged public func addToDepartments(_ value: Department)

    @objc(removeDepartmentsObject:)
    @NSManaged public func removeFromDepartments(_ value: Department)

    @objc(addDepartments:)
    @NSManaged public func addToDepartments(_ values: NSSet)

    @objc(removeDepartments:)
    @NSManaged public func removeFromDepartments(_ values: NSSet)

}
