//
//  ProjectCreatePresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectCreatePresenterProtocol {
    var view: ProjectCreateViewProtocol? { get set }
    var router: ProjectCreateRouterProtocol? { get set }
    
    func viewDidLoad()
}

class ProjectCreatePresenter: ProjectCreatePresenterProtocol {
    
    weak var view: ProjectCreateViewProtocol?
    var router: ProjectCreateRouterProtocol?
    
    func viewDidLoad() {
        
    }
}
