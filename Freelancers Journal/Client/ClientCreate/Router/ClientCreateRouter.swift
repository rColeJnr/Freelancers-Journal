//
//  ClientCreateRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientCreateRouterProtocol {
    func createModule(for project: ProjectModel?) -> ClientCreateViewController
}

class ClientCreateRouter: ClientCreateRouterProtocol {
    
    func createModule(for project: ProjectModel?) -> ClientCreateViewController {
        let vc = ClientCreateViewController()
        var presenter: ClientCreatePresenterProtocol = ClientCreatePresenter()
        var interactor: ClientCreateInteractorProtocol
         = ClientCreateInteractor()
        let projectDataManager: ProjectDataManagerProtocol = ProjectDataManager()
        let router: ClientCreateRouterProtocol = ClientCreateRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.projectDataManager = projectDataManager
        presenter.project = project
        presenter.router = router
        vc.title = "Create a client"
        return vc
    }
    
}
