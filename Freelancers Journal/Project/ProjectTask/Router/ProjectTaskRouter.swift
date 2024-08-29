//
//  ProjectTaskRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectTaskRouterProtocol {
    func createClientModule(from view: ProjectTaskViewProtocol)
    func createModule(/*for project: Project*/) -> ProjectTaskViewController
}

class ProjectTaskRouter: ProjectTaskRouterProtocol {
    
    func createClientModule(from view: ProjectTaskViewProtocol) {
        let clientVc = ClientRouter().createModule()
        
        if let sourceView = view as? ProjectTaskViewController {
            sourceView.navigationController?.pushViewController(clientVc, animated: true)
        }
    }
    
    func createModule(/*for project: Project*/) -> ProjectTaskViewController {
        let vc = ProjectTaskViewController()
        var presenter: ProjectTaskPresenterProtocol = ProjectTaskPresenter()
        let router: ProjectTaskRouterProtocol = ProjectTaskRouter()
        vc.presenter = presenter
        presenter.view = vc
//        presenter.project = project
        presenter.router = router
        vc.title = "Tasks"
        return vc
    }
    
}
