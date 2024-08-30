//
//  ClientRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientRouterProtocol {
    func createClientModule(from view: ClientViewProtocol, for project: ProjectModel)
    func createModule(for project: ProjectModel?) -> ClientViewController
}

class ClientRouter: ClientRouterProtocol {
    
    func createClientModule(from view: ClientViewProtocol, for project: ProjectModel) {
        let clientCreateVc = ClientCreateRouter().createModule(for: project)
        
        if let sourceView = view as? ClientViewController {
            sourceView.navigationController?.pushViewController(clientCreateVc, animated: true)
        }
    }
    
    func createModule(for project: ProjectModel?) -> ClientViewController {
        let view = ClientViewController()
        var interactor: ClientInteractorProtocol & ClientDataManagerResponseProtocol = ClientInteractor()
        var presenter: ClientPresenterProtocol & ClientInteractorResponseProtocol = ClientPresenter()
        let clientDataManager: ClientDataManagerProtocol = ClientDataManager()
        let router: ClientRouterProtocol = ClientRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.clientDataManager = clientDataManager
        presenter.project = project
        presenter.router = router
        view.title = "Select a client"
        return view
    }
    
}
