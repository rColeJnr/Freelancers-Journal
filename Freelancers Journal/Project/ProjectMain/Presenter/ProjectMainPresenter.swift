//
//  ProjectMainPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectMainPresenterProtocol {
    var view: ProjectMainViewProtocol? { get set }
    var router: ProjectMainRouterProtocol? { get set }
    
    func viewDidLoad()
    func showProjectDetails(for project: Project)
}

class ProjectMainPresenter: ProjectMainPresenterProtocol {
    weak var view: ProjectMainViewProtocol?
    var interactor: ProjectMainInteractorProtocol?
    var router: ProjectMainRouterProtocol?
    
    func viewDidLoad() {
        view?.showProjects()
        interactor?.getProjects()
    }
    
    func showProjectDetails(for project: Project) {
        // todo
    }
}
