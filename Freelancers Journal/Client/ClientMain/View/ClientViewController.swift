//
//  ClientsViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ClientViewProtocol: AnyObject {
    var presenter: ClientPresenterProtocol? { get set }
    
    func showClients(with clients: [Client])
    
    func showError(_ error: Error)
}

class ClientViewController: UIViewController, ClientViewProtocol, ClientViewDelegate {
    
    private let clientView = ClientView()
    var presenter: ClientPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        clientView.delegate = self
        setupView(clientView)
        presenter?.viewDidLoad()
        if presenter?.project != nil {
            addDoneButton()
        }
    }
    
    private func addDoneButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(completeProjectCreation(_ :)))
    }
    
    @objc private func completeProjectCreation(_ sender : Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func navigateToCreateClient() {
        guard let project = presenter?.project else {
            return
        }
        presenter?.router?.createClientModule(from: self, for: project)
    }
    
    func showClients(with clients: [Client]) {
        clientView.configureCollectionView(with: clients)
    }
    
    func showError(_ error: any Error) {
        print("Failed to get client with error: \(error.localizedDescription)")
    }
    
}
