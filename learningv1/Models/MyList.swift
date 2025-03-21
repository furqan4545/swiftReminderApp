//
//  MyList.swift
//  learningv1
//
//  Created by Furqan Ali on 3/12/25.
//

import Foundation
import CoreData
import AppKit

@objc(MyList)
public class MyList: NSManagedObject, BaseModel {
    static var all: NSFetchRequest<MyList> {
        let request: NSFetchRequest<MyList> = MyList.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}

extension MyList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?
}

extension MyList : Identifiable {
    
}
