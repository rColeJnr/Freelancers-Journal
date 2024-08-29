//
//  ClientRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientRouterProtocol {
    func createClientModule(from view: ClientViewProtocol)
    func createModule() -> ClientViewController
}

class ClientRouter: ClientRouterProtocol {
    
    func createClientModule(from view: ClientViewProtocol) {
        let clientCreateVc = ClientCreateRouter().createModule()
        
        if let sourceView = view as? ClientViewController {
            sourceView.navigationController?.pushViewController(clientCreateVc, animated: true)
        }
    }
    
    func createModule() -> ClientViewController {
        let vc = ClientViewController()
        var presenter: ClientPresenterProtocol = ClientPresenter()
        let router: ClientRouterProtocol = ClientRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        vc.title = "Select a client"
        return vc
    }
    
}
