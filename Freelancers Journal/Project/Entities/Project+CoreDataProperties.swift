//
//  Project+CoreDataProperties.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var deadline: String?
    @NSManaged public var priority: Bool
    @NSManaged public var difficulty: String?
    @NSManaged public var completed: Bool
    @NSManaged public var client: Client?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Project {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: FjTask)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: FjTask)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Project : Identifiable {

}
