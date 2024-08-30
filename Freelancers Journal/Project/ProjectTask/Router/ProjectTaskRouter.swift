//
//  ProjectTaskRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectTaskRouterProtocol {
    func createClientModule(from view: ProjectTaskViewProtocol, for project: ProjectModel)
    func createModule(for project: ProjectModel) -> ProjectTaskViewController
}

class ProjectTaskRouter: ProjectTaskRouterProtocol {
    
    func createClientModule(from view: ProjectTaskViewProtocol, for project: ProjectModel) {
        let clientVc = ClientRouter().createModule(for: project)
        
        if let sourceView = view as? ProjectTaskViewController {
            sourceView.navigationController?.pushViewController(clientVc, animated: true)
        }
    }
    
    func createModule(for project: ProjectModel) -> ProjectTaskViewController {
        let vc = ProjectTaskViewController()
        var presenter: ProjectTaskPresenterProtocol = ProjectTaskPresenter()
        let router: ProjectTaskRouterProtocol = ProjectTaskRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.project = project
        presenter.router = router
        vc.title = "Tasks"
        return vc
    }
    
}
