//
//  ClientsViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ClientViewProtocol: AnyObject {
    var presenter: ClientPresenterProtocol? { get set }
}

class ClientViewController: UIViewController, ClientViewProtocol, ClientViewDelegate {
    
    private let clientView = ClientView()
    var presenter: ClientPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        clientView.delegate = self
        setupView(clientView)
        addDoneButton()
    }
    
    private func addDoneButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(completeProjectCreation(_ :)))
    }
    
    @objc private func completeProjectCreation(_ sender : Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func navigateToCreateClient() {
        presenter?.router?.createClientModule(from: self)
    }
}
