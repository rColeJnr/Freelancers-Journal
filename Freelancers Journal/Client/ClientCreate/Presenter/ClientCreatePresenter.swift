//
//  ClientCreatePresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ClientCreatePresenterProtocol {
    var view: ClientCreateViewProtocol? { get set }
    var interactor: ClientCreateInteractorProtocol? { get set }
    var router: ClientCreateRouterProtocol? { get set }
    var project: ProjectModel? { get set }
    
    func saveProject(project: ProjectModel)

}

class ClientCreatePresenter: ClientCreatePresenterProtocol {
    weak var view: ClientCreateViewProtocol?
    var interactor: ClientCreateInteractorProtocol?
    var router: ClientCreateRouterProtocol?
    var project: ProjectModel?
    
     
    func saveProject(project: ProjectModel) {
        interactor?.saveProject(project: project)
    }
 
}
