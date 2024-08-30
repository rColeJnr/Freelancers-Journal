//
//  StatisticsInteractor.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

import Foundation

protocol StatisticsInteractorProtocol {
    var presenter: StatisticsInteractorResponseProtocol? { get set }
    var statisticsDataManager: StatisticsDataManagerProtocol? { get set }
    
    func getProjects()
}

protocol StatisticsInteractorResponseProtocol {
    func didGetProjects(_ projects: [Project])
    func didGetError(_ error: Error)
}

class StatisticsInteractor: StatisticsInteractorProtocol {
    var presenter: StatisticsInteractorResponseProtocol?
    
    var statisticsDataManager: StatisticsDataManagerProtocol?
    
    func getProjects() {
        statisticsDataManager?.getProjects(completion:{ [weak self] FjProjectResult in
        
           switch FjProjectResult {
           case .success(let projects):
               self?.presenter?.didGetProjects(projects)
           case .failure(let error):
               self?.presenter?.didGetError(error)
        }
        })
    }
    
    
}

extension StatisticsInteractor: StatisticsDataManagerResponseProtocol {
    func didGetProjects(_ projects: [Project]) {
        presenter?.didGetProjects(projects)
    }
    
    func didGetError(_ error: any Error) {
        presenter?.didGetError(error)
    }
    
    
}
