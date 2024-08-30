//
//  StatisticsDataManager.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

import CoreData

protocol StatisticsDataManagerProtocol {
    func getProjects(completion: @escaping (FjProjectResult) -> Void)
}

protocol StatisticsDataManagerResponseProtocol {
    func didGetProjects(_ projects: [Project])
    func didGetError(_ error: Error)
}

class StatisticsDataManager: StatisticsDataManagerProtocol {
    
    func getProjects(completion: @escaping (FjProjectResult) -> Void) {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
        
        guard let viewContext = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }
        
        viewContext.perform {
            do {
                let projects = try viewContext.fetch(fetchRequest)
                completion(.success(projects))
            } catch {
                completion(.failure(FjError.failedToFetchCoreDataObject))
            }
        }
    }
}
