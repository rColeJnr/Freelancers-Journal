//
//  FjTask+CoreDataProperties.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//
//

import Foundation
import CoreData


extension FjTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FjTask> {
        return NSFetchRequest<FjTask>(entityName: "FjTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var project: Project?

}

extension FjTask : Identifiable {

}
