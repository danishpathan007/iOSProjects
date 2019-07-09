//
//  Department+CoreDataProperties.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension Department {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Employee)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Employee)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)

}
