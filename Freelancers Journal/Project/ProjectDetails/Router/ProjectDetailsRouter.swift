//
//  ProjectDetailsRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ProjectDetailsRouterProtocol {
    func createModule() -> ProjectDetailsViewController
}

class ProjectDetailsRouter: ProjectDetailsRouterProtocol {

    func createModule() -> ProjectDetailsViewController {
        let vc = ProjectDetailsViewController()
        var presenter: ProjectDetailsPresenterProtocol = ProjectDetailsPresenter()
        let router: ProjectDetailsRouterProtocol = ProjectDetailsRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        vc.title = "My Project"
        return vc
    }
    
}
