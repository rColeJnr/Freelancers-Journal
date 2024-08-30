//
//  ProjectDetailsRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ProjectDetailsRouterProtocol {
    func createModule(for project: Project) -> ProjectDetailsViewController
}

class ProjectDetailsRouter: ProjectDetailsRouterProtocol {

    func createModule(for project: Project) -> ProjectDetailsViewController {
        let vc = ProjectDetailsViewController()
        var interactor: ProjectDetailsInteractorProtocol = ProjectDetailsInteractor()
        var presenter: ProjectDetailsPresenterProtocol = ProjectDetailsPresenter()
        let projectDataManager: ProjectDataManagerProtocol = ProjectDataManager()
        let router: ProjectDetailsRouterProtocol = ProjectDetailsRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.projectDataManager = projectDataManager
        presenter.project = project
        presenter.router = router
        vc.title = project.name
        return vc
    }
    
}
