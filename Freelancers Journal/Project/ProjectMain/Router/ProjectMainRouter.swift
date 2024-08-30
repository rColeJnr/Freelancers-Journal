//
//  ProjectMainRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectMainRouterProtocol: AnyObject {
    
    func createProjectCreateModule(from view: ProjectMainViewProtocol)
    
    func createProjectDetailsModule()
    
    func createModule() -> ProjectMainViewController
    
}

class ProjectMainRouter: ProjectMainRouterProtocol {
    
    func createProjectCreateModule(from view: any ProjectMainViewProtocol) {
        let createVc = ProjectCreateRouter().createModule()
        
        if let sourceView = view as? ProjectMainViewController {
            sourceView.navigationController?.pushViewController(createVc, animated: true)
        }
    }
    
    func createProjectDetailsModule() {
        //
    }
    
    func createModule() -> ProjectMainViewController {
        let viewController = ProjectMainViewController()
        var presenter: ProjectMainPresenterProtocol & ProjectMainInteractorResponseProtocol = ProjectMainPresenter()
        var interactor: ProjectMainInteractorProtocol & ProjectDataManagerResponseProtocol = ProjectMainInteractor()
        let projectDataManager: ProjectDataManagerProtocol = ProjectDataManager()
        let router: ProjectMainRouterProtocol = ProjectMainRouter()
        viewController.presenter = presenter
        presenter.view =  viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.projectDataManager = projectDataManager
        presenter.router = router
        return viewController
    }
}
