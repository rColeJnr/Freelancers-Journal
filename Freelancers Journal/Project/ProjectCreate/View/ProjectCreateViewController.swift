//
//  ProjectCreateVIewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectCreateViewProtocol: AnyObject {
    var presenter: ProjectCreatePresenterProtocol? { get set }
}

class ProjectCreateViewController: UIViewController, ProjectCreateViewProtocol {
    
    private let projectCreateView = ProjectCreateView()
    var presenter: ProjectCreatePresenterProtocol?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        presenter?.viewDidLoad()
        setupView(projectCreateView)
        addNextButton()
    }

    private func addNextButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(navigateToTasks(_ :)))
    }
    
    @objc private func navigateToTasks(_ sender : Any) {
        guard let project = projectCreateView.canMoveNext() else {
            return
        }
        presenter?.router?.createProjectTaskModule(from: self, for: project)
    }
    
}
