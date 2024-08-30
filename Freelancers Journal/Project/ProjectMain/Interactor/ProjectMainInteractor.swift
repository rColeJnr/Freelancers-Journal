//
//  ProjectMainInteractor.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectMainInteractorProtocol {
    var presenter: ProjectMainInteractorResponseProtocol? { get set }
    var projectDataManager: ProjectDataManagerProtocol? {get set}
    
    // Presenter -> Interactor
    func getCompletedProjects()
    func getUnompletedProjects()
    func deleteProject(project: Project)
    func toggleProjectIsComplete(project: Project, isComplete: Bool)
}

protocol ProjectMainInteractorResponseProtocol {
    func didGetCompletedProjects(_ projects: [Project])
    func didGetUncompletedProjects(_ projects: [Project])
 
    func didSaveProject()
    func didDeleteProject()
    func didToggleProjectIsComplete()

    func onError(_ error: Error)
}

class ProjectMainInteractor: ProjectMainInteractorProtocol {
    
    var presenter: ProjectMainInteractorResponseProtocol?
    
    var projectDataManager: ProjectDataManagerProtocol?
    
    func getCompletedProjects() {
        projectDataManager?.getCompletedProjects{ [weak self] FjProjectResult in
            switch FjProjectResult {
            case .success(let projects):
                self?.presenter?.didGetCompletedProjects(projects)
            case .failure(let error):
                self?.presenter?.onError(error)
            }
        }
    }
    
    func getUnompletedProjects() {
        projectDataManager?.getUncompletedProjects{ [weak self] FjProjectResult in
            switch FjProjectResult {
            case .success(let projects):
                self?.presenter?.didGetUncompletedProjects(projects)
            case .failure(let error):
                self?.presenter?.onError(error)
            }
        }
    }
    
    func toggleProjectIsComplete(project: Project, isComplete: Bool) {
        projectDataManager?.toggleProjectIsComplete(project: project, isComplete: isComplete)
    }

    func deleteProject(project: Project) {
        projectDataManager?.deleteProject(project: project)
    }
}

extension ProjectMainInteractor: ProjectDataManagerResponseProtocol {
    func didSaveProject() {
        presenter?.didSaveProject()
    }
    
    func didDeleteProject() {
        presenter?.didDeleteProject()
    }
    
    func didToggleProjectIsComplete() {
        presenter?.didToggleProjectIsComplete()
    }
    
    func didGetCompletedProjects(_ projects: [Project]) {
        presenter?.didGetCompletedProjects(projects)
    }
    
    func didGetUncompletedProject(_ projects: [Project]) {
        presenter?.didGetUncompletedProjects(projects)
    }
    
    func onError(_ error: any Error) {
        presenter?.onError(error)
    }
    
}
