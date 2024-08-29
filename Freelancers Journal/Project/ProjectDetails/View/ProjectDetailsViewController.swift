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

class ProjectDetailsViewController: UIViewController, ProjectDetailsViewProtocol {
    
    private let projectDetailsView = ProjectDetailsView()
    var presenter: ProjectDetailsPresenterProtocol?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        presenter?.viewDidLoad()
        setupView(projectDetailsView)
    }

    func removeProject() {
        
    }
    
}

