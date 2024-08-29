//
//  ProjectDetailsPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

protocol ProjectDetailsPresenterProtocol {
    var view: ProjectDetailsViewProtocol? { get set }
    var router: ProjectDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
}

class ProjectDetailsPresenter: ProjectDetailsPresenterProtocol {
    
    weak var view: ProjectDetailsViewProtocol?
    var router: ProjectDetailsRouterProtocol?
    
    func viewDidLoad() {
        
    }
}
