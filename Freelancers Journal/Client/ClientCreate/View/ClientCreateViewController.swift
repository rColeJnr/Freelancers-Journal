//
//  ClientCreateViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ClientCreateViewProtocol: AnyObject {
    var presenter: ClientCreatePresenterProtocol? { get set }
}

class ClientCreateViewController: UIViewController, ClientCreateViewProtocol {
    
    private let clientCreateView = ClientCreateView()
    var presenter: ClientCreatePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupView(clientCreateView)
        addDoneButton()
    }
    
    private func addDoneButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(completeProjectCreation(_ :)))
    }
    
    @objc private func completeProjectCreation(_ sender : Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

