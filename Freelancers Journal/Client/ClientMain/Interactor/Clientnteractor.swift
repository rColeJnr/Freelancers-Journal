//
//  ClientMainInteractor.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ClientInteractorProtocol {
    var presenter: ClientInteractorResponseProtocol? { get set }
    var clientDataManager: ClientDataManagerProtocol? { get set }
    
    // Presenter -> interactor
    func getClients()
}

protocol ClientInteractorResponseProtocol {
    func didGetClients(_ clients: [Client])
    func onError(_ error: Error)
}

class ClientInteractor: ClientInteractorProtocol {
    
    var presenter: ClientInteractorResponseProtocol?
    var clientDataManager: ClientDataManagerProtocol?
    
    func getClients() {
        clientDataManager?.getClients(completion:{ [weak self] FjClientResult in
            switch FjClientResult {
            case .success(let array):
                self?.presenter?.didGetClients(array)
            case .failure(let fjError):
                self?.presenter?.onError(fjError)
            }
        })
    }
}

extension ClientInteractor: ClientDataManagerResponseProtocol {
    func didGetClients(_ clients: [Client]) {
        presenter?.didGetClients(clients)
    }
    
    func onError(_ error: any Error) {
        presenter?.onError(error)
    }
    
    
}

