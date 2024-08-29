//
//  ProjectCreateRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectCreateRouterProtocol {
    func createProjectTaskModule(from view: ProjectCreateViewProtocol /*for project: Project*/)
    func createModule() -> ProjectCreateViewController
}

class ProjectCreateRouter: ProjectCreateRouterProtocol {
    
    func createProjectTaskModule(from view: ProjectCreateViewProtocol/* for project: Project*/) {
        let taskVc = ProjectTaskRouter().createModule(/*for: project*/)
        
        if let sourceView = view as? ProjectCreateViewController {
            sourceView.navigationController?.pushViewController(taskVc, animated: true)
        }
    }
    
    func createModule() -> ProjectCreateViewController {
        let vc = ProjectCreateViewController()
        var presenter: ProjectCreatePresenterProtocol = ProjectCreatePresenter()
        let router: ProjectCreateRouterProtocol = ProjectCreateRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        vc.title = "Add a new Project"
        return vc
    }
    
}
