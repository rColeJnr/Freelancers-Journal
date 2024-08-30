//
//  HomeViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit
import CoreData

protocol ProjectMainViewProtocol: AnyObject {
    var presenter: ProjectMainPresenterProtocol? { get set }
    
    // Presenter -> View
    func showUncompletedProjects(with projects: [Project])
    
    func showUncompletedLoading()
    
    func hideUncompletedLoading()
    
    func showCompletedProjects(with projects: [Project])
    
    func showCompletedLoading()
    
    func hideCompletedLoading()
    
    func updateProjectList()
    
    func showError(error: Error)
}

class ProjectMainViewController: UIViewController, ProjectMainViewDelegate {
    
    var presenter: ProjectMainPresenterProtocol?
    private let projectMainView = ProjectMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        projectMainView.delegate = self
        setupView(projectMainView)
    }
    
    func navigateToCreateProject() {
        presenter?.router?.createProjectCreateModule(from: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewDidLoad()
    }
    
}

extension ProjectMainViewController: ProjectMainViewProtocol {
   
    func showUncompletedProjects(with projects: [Project]) {
        print("got uncompleted project \(projects.count)")
        projects.forEach({ pro in
            print("name: \(pro.name!)")
        })
        if !projects.isEmpty {
            projectMainView.configureCollectionView(with: projects)
        }
    }
    
    func showUncompletedLoading() {
        // not implemented
    }
    
    func hideUncompletedLoading() {
        // not implemented
    }
    
    func showCompletedProjects(with projects: [Project]) {
        print("got completed project \(projects.count)")
        if !projects.isEmpty {
            projectMainView.configureCollectionView(with: projects)
        }
    }
    
    func showCompletedLoading() {
        // not implemented
    }
    
    func hideCompletedLoading() {
        // not implemented
    }
    
    func updateProjectList() {
        // jhjhkjjh
    }
    
    func showError(error: any Error) {
        print("Failed to get project with error: \(error)")
    }
    
}
