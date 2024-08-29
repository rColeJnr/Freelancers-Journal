//
//  ProjectCreateVIewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectCreateViewController: UIViewController {
    
    private let projectCreateView = ProjectCreateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new project"
        setupView(projectCreateView)
    }
}
