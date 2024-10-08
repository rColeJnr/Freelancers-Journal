//
//  ClientPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientPresenterProtocol {
    var view: ClientViewProtocol? { get set }
    var interactor: ClientInteractorProtocol? { get set }
    var router: ClientRouterProtocol? { get set }
    var project: ProjectModel? { get set }
    
    func viewDidLoad()
}

class ClientPresenter: ClientPresenterProtocol {
    weak var view: ClientViewProtocol?
    var interactor: ClientInteractorProtocol?
    var router: ClientRouterProtocol?
    var project: ProjectModel?
    
    func viewDidLoad() {
        interactor?.getClients()
    }
}

extension ClientPresenter: ClientInteractorResponseProtocol {
    func didGetClients(_ clients: [Client]) {
        view?.showClients(with: clients)
    }
    
    func onError(_ error: any Error) {
        view?.showError(error)
    }
    
    
}
