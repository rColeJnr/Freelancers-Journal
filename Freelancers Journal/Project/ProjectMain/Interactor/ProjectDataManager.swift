//
//  ProjectDataManager.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import CoreData

protocol ProjectDataManagerProtocol {
    // Interactor -> LocalDataManager
    func getCompletedProjects(completion: @escaping (FjResult) -> Void)
    func getUncompletedProjects(completion: @escaping (FjResult) -> Void)

    func saveProject(project: ProjectModel) throws
    func deleteProject(project: Project)
    func toggleProjectIsComplete(project: Project, isComplete: Bool)
}

protocol ProjectDataManagerResponseProtocol {
    func didGetCompletedProjects(_ projects: [Project])
    func didGetUncompletedProject(_ projects: [Project])
    
    func didSaveProject()
    func didDeleteProject()
    func didToggleProjectIsComplete()
    func onError(_ error: Error)
}

class ProjectDataManager: ProjectDataManagerProtocol {
        
    func getCompletedProjects(completion: @escaping (FjResult) -> Void) {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
//        let sortByDeadline = NSSortDescriptor(key: #keyPath(Project.deadline), ascending: true)
//        let predicate = NSPredicate(format: "\(#keyPath(Project.completed)) == \(true)")
        
//        fetchRequest.sortDescriptors = [sortByDeadline]
//        fetchRequest.predicate = predicate
        
        guard let viewContext = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }
        
        viewContext.perform {
            do {
                let projects = try viewContext.fetch(fetchRequest)
                completion(.success(projects))
            } catch {
                completion(.failure(error))
            }
        }
    }
    func getUncompletedProjects(completion: @escaping (FjResult) -> Void) {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
//        let sortByDeadline = NSSortDescriptor(key: #keyPath(Project.deadline), ascending: true)
//        let predicate = NSPredicate(format: "\(#keyPath(Project.completed)) == \(false)")
        
//        fetchRequest.sortDescriptors = [sortByDeadline]
//        fetchRequest.predicate = predicate
        
        guard let viewContext = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }
        viewContext.perform {
            do {
                let projects = try viewContext.fetch(fetchRequest)
                completion(.success(projects))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveProject(project: ProjectModel) throws {

        guard let managedOC = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }

        var newTaskList = [FjTask]()
        
        if let taskEntity = NSEntityDescription.entity(forEntityName: "FjTask", in: managedOC) {
            let newTask = FjTask(entity: taskEntity, insertInto: managedOC)
            for pTask in project.tasks {
                newTask.setValue(pTask.name, forKey: "name")
                newTask.setValue(pTask.price, forKey: "price")
                newTaskList.append(newTask)
            }
        }
        
        var finalClient: Client? = nil
        if let clientEntity = NSEntityDescription.entity(forEntityName: "Client", in: managedOC) {
            let newClient = Client(entity: clientEntity, insertInto: managedOC)
                newClient.setValue(project.client?.name, forKey: "name")
                newClient.setValue(project.client?.description, forKey: "details")
                newClient.setValue(project.client?.email, forKey: "email")
                newClient.setValue(project.client?.number, forKey: "number")
                newClient.setValue(project.client!.regular, forKey: "regular")
            finalClient = newClient
        }
        
        if let projectEntity = NSEntityDescription.entity(forEntityName: "Project", in: managedOC) {
            let newProject = Project(entity: projectEntity, insertInto: managedOC)
            newProject.setValue(project.name, forKey: "name")
            newProject.setValue(project.description, forKey: "details")
            newProject.setValue(project.deadline, forKey: "deadline")
            newProject.setValue(project.priority, forKey: "priority")
            newProject.setValue(project.diff, forKey: "difficulty")
            newProject.setValue(project.completed, forKey: "completed")
            newProject.setValue(finalClient, forKey: "client")
            newProject.setValue(Set(newTaskList), forKey: "task")
        }
        do {
            try managedOC.save()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            throw FjError.failedToSaveToCoreData
        }
    }
    
    func deleteProject(project: Project) {
        guard let context = CoreDataManager.persistentContainer else {
            print("failed to create core data")
            return
        }
        do {
            context.delete(project)
            try context.save()
        } catch {
            print("Errr deleting")
        }
    }
    
    func toggleProjectIsComplete(project: Project, isComplete: Bool) {
//        let context = CoreDataManager.persistentContainer.viewContext
//        project.completed = isComplete
//        do {
//            try context.save()
//        } catch {
//            print("Failed to update project")
//        }
    }
}
