//
//  FjCoreDataManager.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static var persistentContainer: NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}
