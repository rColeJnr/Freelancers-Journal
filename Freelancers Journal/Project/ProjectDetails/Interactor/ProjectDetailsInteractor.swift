//
//  ProjectDetailsInteractor.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ProjectDetailsInteractorProtocol {
    var presenter: ProjectDetailsPresenterProtocol? { get set }
    var projectDataManager: ProjectDataManagerProtocol? { get set }
    
    func deleteProject(project: Project)
    func toggleProjectIsComplete(project: Project, isComplete: Bool)
    
}

protocol ProjectDetailsInteractorResponseProtocol {
    func didSaveProject()
    func onError(_ error: Error)
}

class ProjectDetailsInteractor: ProjectDetailsInteractorProtocol {
    
    var presenter: ProjectDetailsPresenterProtocol?
    var projectDataManager: ProjectDataManagerProtocol?
        
    func deleteProject(project: Project) {
        projectDataManager?.deleteProject(project: project)
    }
    
    func toggleProjectIsComplete(project: Project, isComplete: Bool) {
        projectDataManager?.toggleProjectIsComplete(project: project, isComplete: isComplete)
    }
    
}
