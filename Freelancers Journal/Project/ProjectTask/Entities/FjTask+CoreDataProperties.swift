//
//  FjTask+CoreDataProperties.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//
//

import Foundation
import CoreData


extension FjTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FjTask> {
        return NSFetchRequest<FjTask>(entityName: "FjTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension FjTask : Identifiable {

}
