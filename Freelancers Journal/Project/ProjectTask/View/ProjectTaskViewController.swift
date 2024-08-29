//
//  ProjectTaskViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectTaskViewProtocol: AnyObject {
    var presenter: ProjectTaskPresenterProtocol? { get set }
}

class ProjectTaskViewController: UIViewController, ProjectTaskViewProtocol {
    
    private let projectTaskView = ProjectTaskView()
    var presenter: ProjectTaskPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupView(projectTaskView)
        addNextButton()
    }
    
    private func addNextButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(navigateToClientModule(_ :)))
    }
    
    @objc private func navigateToClientModule(_ sender : Any) {
        presenter?.router?.createClientModule(from: self/*, for: project*/)
    }
    
}
