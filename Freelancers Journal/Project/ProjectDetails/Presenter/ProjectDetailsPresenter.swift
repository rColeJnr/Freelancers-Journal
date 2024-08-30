//
//  ProjectDetailsPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ProjectDetailsPresenterProtocol {
    var view: ProjectDetailsViewProtocol? { get set }
    var interactor: ProjectDetailsInteractorProtocol? { get set }
    var router: ProjectDetailsRouterProtocol? { get set }
    var project: Project? { get set }
    func viewDidLoad()
}

class ProjectDetailsPresenter: ProjectDetailsPresenterProtocol {
    
    weak var view: ProjectDetailsViewProtocol?
    var interactor: ProjectDetailsInteractorProtocol?
    var router: ProjectDetailsRouterProtocol?
    var project: Project?
    
    func viewDidLoad() {
        
    }
}
