//
//  Department+CoreDataClass.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Department)
public class Department: NSManagedObject {
    
    static private let departmentEntity = NSEntityDescription.entity(forEntityName: Constants.CoreData.Entity.department, in: DataManager.mainContext)
    
    public class func setData(name: String?, id: String?,employees: [Employee]? ) -> Department {
        var department: Department!
        department = get(ids: [id!])?.first // Get existing List
        if department == nil {
            department = Department(entity: departmentEntity!, insertInto:  DataManager.mainContext) as Department // Create new List
        }
        department.id = id
        department.name = name
        
        if let employees = employees {
            department.addToEmployees([employees])
            employees.forEach { (employee) in
                employee.addToDepartments(department)
            }
        }
       DataManager.persist(synchronously: false)
        return department
    
    }
    
    /**
     Get the user based on Ids
     */
    class func get(ids: [String]) -> [Department]? {
        let predicate = NSPredicate(format: "id IN %@", ids)
        return DataManager.fetchObjects(entity: Department.self,  predicate: predicate, sortDescriptors: nil , context: DataManager.mainContext)
    }
    
    /**
     Get the user based on Ids
     */
    class func getAll() -> [Department]? {
        return DataManager.fetchObjects(entity: Department.self,  predicate: nil, sortDescriptors: nil , context: DataManager.mainContext)
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
