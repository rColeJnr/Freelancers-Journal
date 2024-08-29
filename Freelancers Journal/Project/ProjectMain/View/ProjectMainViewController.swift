//
//  HomeViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectMainViewProtocol: AnyObject {
    var presenter: ProjectMainPresenterProtocol? { get set }
    func showProjects()
}

class ProjectMainViewController: UIViewController, ProjectMainViewProtocol, ProjectMainViewDelegate {
    
    var presenter: ProjectMainPresenterProtocol?
    private let projectMainView = ProjectMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        projectMainView.delegate = self
        setupView(projectMainView)
        presenter?.viewDidLoad()
    }
    
    func showProjects() {
        // show projects
    }
    
    func navigateToCreateProject() {
        presenter?.router?.createProjectCreateModule(from: self)
    }
}
