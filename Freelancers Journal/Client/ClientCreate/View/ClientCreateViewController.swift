//
//  ClientCreateViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ClientCreateViewController: UIViewController {
    
    private let projectCreateView = ProjectCreateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new client"
        setupView(projectCreateView)
    }
}

