//
//  ClientDataManager.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

import CoreData

protocol ClientDataManagerProtocol {
    // Interactor -> LocalDataManager
    func getClients(completion: @escaping (FjClientResult) -> Void)

    func saveClient(client: ClientModel) throws
}

protocol ClientDataManagerResponseProtocol {
    func didGetClients(_ clients: [Client])
    
    func onError(_ error: Error)
}

class ClientDataManager: ClientDataManagerProtocol {
        
    func getClients(completion: @escaping (FjClientResult) -> Void) {
        let fetchRequest: NSFetchRequest<Client> = Client.fetchRequest()
        let sortByDeadline = NSSortDescriptor(key: #keyPath(Project.name), ascending: true)
        
        fetchRequest.sortDescriptors = [sortByDeadline]
        
        guard let viewContext = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }
        
        viewContext.perform {
            do {
                let clients = try viewContext.fetch(fetchRequest)
                completion(.success(clients))
            } catch {
                completion(.failure(FjError.failedToFetchCoreDataObject))
            }
        }
    }

    func saveClient(client: ClientModel) throws {

        guard let managedOC = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }

        if let clientEntity = NSEntityDescription.entity(forEntityName: "Client", in: managedOC) {
            let newClient = Client(entity: clientEntity, insertInto: managedOC)
            newClient.setValue(client.name, forKey: "name")
            newClient.setValue(client.description, forKey: "details")
            newClient.setValue(client.email, forKey: "email")
            newClient.setValue(client.number, forKey: "number")
            newClient.setValue(client.regular, forKey: "regular")
        }
        
        do {
            try managedOC.save()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            throw FjError.failedToSaveToCoreData
        }
    }
    
}
