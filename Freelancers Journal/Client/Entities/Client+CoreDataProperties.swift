//
//  Client+CoreDataProperties.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var number: String?
    @NSManaged public var email: String?
    @NSManaged public var regular: Bool
    @NSManaged public var project: Project?

}

extension Client : Identifiable {

}
