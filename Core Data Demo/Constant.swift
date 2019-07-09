//
//  Constant.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//

import Foundation
import UIKit

class Constants: NSObject {
    static let DOCUMENT_PATH = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    struct CoreData {
        struct Entity {
            static let department = "Department"
            static let employee = "Employee"
        }
        
        struct Container {
            static let dataModelName = "EmployeeDetails"
            static let persistentStoreName = "EmployeeDetails"
        }
    }
    
    
}
