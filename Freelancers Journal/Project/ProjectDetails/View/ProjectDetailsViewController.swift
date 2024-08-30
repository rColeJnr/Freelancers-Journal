//
//  ProjectDetailsViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import UIKit

protocol ProjectDetailsViewProtocol: AnyObject {
    var presenter: ProjectDetailsPresenterProtocol? { get set }
}

class ProjectDetailsViewController: UIViewController, ProjectDetailsViewProtocol, ProjectDetailsViewDelegate {
    
    private let projectDetailsView = ProjectDetailsView()
    var presenter: ProjectDetailsPresenterProtocol?
 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        presenter?.viewDidLoad()
        projectDetailsView.delegate = self
        projectDetailsView.configure(with: presenter?.project)
        setupView(projectDetailsView)
    }

    func onDeleteClick(project: Project) {
        let ac = UIAlertController(
            title: "Delete \"\(project.name!)\"",
            message: "Are you sure you want to delete this project?",
            preferredStyle: .actionSheet
        )
        let cancelAction = UIAlertAction(title: "No", style: .default)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) -> Void in
            self.presenter?.interactor?.deleteProject(project: project)
            self.navigationController?.popToRootViewController(animated: true)
        })
        ac.addAction(deleteAction)
        self.present(ac, animated: true, completion: nil)
    }
    
    func onCompleteClick(project: Project) {
        presenter?.interactor?.toggleProjectIsComplete(project: project, isComplete: !project.completed)
    }
    
}

