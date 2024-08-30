//
//  ClientCreateInteractor.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ClientCreateInteractorProtocol {
    var presenter: ClientCreatePresenterProtocol? { get set }
    var projectDataManager: ProjectDataManagerProtocol? { get set }
    
    func saveProject(project: ProjectModel)
    
}

protocol ClientCreateInteractorResponseProtocol {
    func didSaveProject()
    func onError(_ error: Error)
}

class ClientCreateInteractor: ClientCreateInteractorProtocol {
    
    var presenter: ClientCreatePresenterProtocol?
    var projectDataManager: ProjectDataManagerProtocol?
        
    func saveProject(project: ProjectModel) {
        do {
            try projectDataManager?.saveProject(project: project)
        } catch {
            print("Error saving to core data \(error.localizedDescription)")
//            self.presenter?.onError(FjError.failedToSaveToCoreData)
            return
        }
    }
    
}
