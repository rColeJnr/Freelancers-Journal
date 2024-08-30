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
    @NSManaged public var price: Double
    @NSManaged public var date: Date?
    @NSManaged public var task: FjTask?
    @NSManaged public var client: Client?

}

extension Project : Identifiable {

}
