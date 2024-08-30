//
//  ProjectMainPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectMainPresenterProtocol {
    var view: ProjectMainViewProtocol? { get set }
    var interactor: ProjectMainInteractorProtocol? { get set }
    var router: ProjectMainRouterProtocol? { get set }
    
    func viewDidLoad()
    func showProjectDetails(for project: Project)
}

class ProjectMainPresenter: ProjectMainPresenterProtocol {
    weak var view: ProjectMainViewProtocol?
    var interactor: ProjectMainInteractorProtocol?
    var router: ProjectMainRouterProtocol?
    
    func viewDidLoad() {
        print("View did load")
        view?.showCompletedLoading()
        view?.showUncompletedLoading()
        interactor?.getCompletedProjects()
        interactor?.getUnompletedProjects()
    }
    
    func showProjectDetails(for project: Project) {
        router?.createProjectDetailsModule()
    }
}

extension ProjectMainPresenter: ProjectMainInteractorResponseProtocol {
    func didGetCompletedProjects(_ projects: [Project]) {
        view?.hideCompletedLoading()
        view?.showCompletedProjects(with: projects)
    }
    
    func didGetUncompletedProjects(_ projects: [Project]) {
        view?.hideUncompletedLoading()
        view?.showUncompletedProjects(with: projects)
    }
    
    func didSaveProject() {
        view?.updateProjectList()
    }
    
    func didDeleteProject() {
        view?.updateProjectList()
    }
    
    func didToggleProjectIsComplete() {
        view?.updateProjectList()
    }
    
    func onError(_ error: any Error) {
        view?.hideCompletedLoading()
        view?.hideUncompletedLoading()
        view?.showError(error: error)
    }
}
