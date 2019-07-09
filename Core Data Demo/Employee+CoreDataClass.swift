//
//  Employee+CoreDataClass.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Employee)
public class Employee: NSManagedObject {
    
    static private let employeeEntity = NSEntityDescription.entity(forEntityName: Constants.CoreData.Entity.employee, in: DataManager.mainContext)
    
    
    public class func setData(departments: [Department]?, name: String?, id: String?,  project:String? ,bio:String?) -> Employee {
        
        var employee:Employee!
        
        employee = get(ids: [id!])?.first
        
        if employee == nil {
            employee = Employee(entity: employeeEntity!, insertInto: DataManager.mainContext) as Employee // Create new List
        }
        employee.name = name
        employee.project = project
        employee.bio = bio
      
        
        if let departments = departments {
            departments.forEach { (dep) in
                employee.addToDepartments(dep)
            }
            departments.forEach { (department) in
               department.addToEmployees(employee)
            }
        }
   
        DataManager.persist(synchronously: false)
        return employee
        
}

    /**
     Get the user based on Ids
     */
    class func get(ids: [String]) -> [Employee]? {
        let predicate = NSPredicate(format: "id IN %@", ids)
        return DataManager.fetchObjects(entity: Employee.self,  predicate: predicate, sortDescriptors: nil , context: DataManager.mainContext)
    }
    
    /**
     Get the user based on Ids
     */
    class func getAll() -> [Employee]? {
        return DataManager.fetchObjects(entity: Employee.self,  predicate: nil, sortDescriptors: nil , context: DataManager.mainContext)
    }
    
    
    /**
     Delete the List based on Ids
     */
    class func delete(ids: [String]) {
        guard let objects = get(ids: ids) else { return}
        DataManager.delete(objects, in: DataManager.mainContext)
        DataManager.persist(synchronously: false)
    }
}
