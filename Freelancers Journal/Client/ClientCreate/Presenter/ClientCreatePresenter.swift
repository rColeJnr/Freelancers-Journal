//
//  ClientCreatePresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientCreatePresenterProtocol {
    var view: ClientCreateViewProtocol? { get set }
    var router: ClientCreateRouterProtocol? { get set }
    
    func viewDidLoad()
}

class ClientCreatePresenter: ClientCreatePresenterProtocol {
    weak var view: ClientCreateViewProtocol?
    var router: ClientCreateRouterProtocol?
    
    func viewDidLoad() {
        //
    }
}
