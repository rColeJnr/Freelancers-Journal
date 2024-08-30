//
//  ProjectTaskPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

protocol ProjectTaskPresenterProtocol {
    var view: ProjectTaskViewProtocol? { get set }
    var router: ProjectTaskRouterProtocol? { get set }
    var project: ProjectModel? { get set }
    
    func viewDidLoad()
}

class ProjectTaskPresenter: ProjectTaskPresenterProtocol {
    weak var view: ProjectTaskViewProtocol?
    var router: ProjectTaskRouterProtocol?
    var project: ProjectModel?
    
    func viewDidLoad() {
        //
    }
}
