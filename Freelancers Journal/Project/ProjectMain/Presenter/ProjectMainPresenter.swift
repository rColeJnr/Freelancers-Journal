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
}

class ProjectMainPresenter: ProjectMainPresenterProtocol {
    weak var view: ProjectMainViewProtocol?
    var interactor: ProjectMainInteractorProtocol?
    var router: ProjectMainRouterProtocol?
    
    func viewDidLoad() {
        view?.showCompletedLoading()
        view?.showUncompletedLoading()
        interactor?.getCompletedProjects()
        interactor?.getUncompletedProjects()
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
    
    func onError(_ error: any Error) {
        view?.hideCompletedLoading()
        view?.hideUncompletedLoading()
        view?.showError(error: error)
    }
}
