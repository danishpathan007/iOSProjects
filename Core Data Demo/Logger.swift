//
//  Logger.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//

import Foundation

class Logger {
    private static let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    private static let logFilePath = Logger.documentsPath + "/log"
    
    private static var fileManager = FileManager()
    
    private static let logToFile:Bool = false
    
    class func log(_ msg:Any){
        #if DEBUG
        print("\(msg)")
        #endif
    }
    private class func logToFile(_ msg:Any){
        if !logToFile {return }
        createFileIfNeeded()
        var t = String(describing: msg)
        t = String.init(format: "%@\n\n%@", Date().description,t)
        let data = t.data(using: String.Encoding.utf8)
        do {
            if let fileHandle = FileHandle(forWritingAtPath: logFilePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data!)
                fileHandle.closeFile()
            }
        }
        
    }
    private class func createFileIfNeeded() {
        if !fileManager.fileExists(atPath: logFilePath) {
            fileManager.createFile(atPath: logFilePath, contents: nil, attributes: nil)
        }
    }
    
}

