//
//  ClientCreateRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientCreateRouterProtocol {
    func createModule() -> ClientCreateViewController
}

class ClientCreateRouter: ClientCreateRouterProtocol {
    
    func createModule() -> ClientCreateViewController {
        let vc = ClientCreateViewController()
        var presenter: ClientCreatePresenterProtocol = ClientCreatePresenter()
        let router: ClientCreateRouterProtocol = ClientCreateRouter()
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        vc.title = "Create a client"
        return vc
    }
    
}
