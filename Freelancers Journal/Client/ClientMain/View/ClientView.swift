//
//  ClientView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ClientViewDelegate {
    func navigateToCreateClient()
}

class ClientView: UIView {
    
    var clients: [Client] = []
    var delegate: ClientViewDelegate?
    
    // MARK: - VIEWS
    let image = {
        let view = UIImageView()
        view.image = UIImage( named: "uncertain_client")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title = {
        let view = UILabel()
        view.text = "You have no saved clients"
        view.font = .systemFont(ofSize: 26, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionTV = {
        let view = UILabel()
        view.text = "Add a new client"
        view.font = .systemFont(ofSize: 18, weight: .medium)
        view.textColor = .white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let createNewBtn = {
        let view = UIImageView()
        view.image = UIImage( named: "circle_add_btn")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ClientViewCell.self, forCellWithReuseIdentifier: ClientViewCell.cellIdentifier)
        view.backgroundColor = .systemCyan
        view.isHidden = true
        return view
    }()
    
    @objc private func onCreateNewBtnClick(_ sender: Any) {
        delegate?.navigateToCreateClient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(image, title, descriptionTV, createNewBtn, collectionView)
        createNewBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCreateNewBtnClick(_ :))))
        collectionView.delegate = self
        collectionView.dataSource = self
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            createNewBtn.heightAnchor.constraint(equalToConstant: 70),
            createNewBtn.widthAnchor.constraint(equalToConstant: 70),
            createNewBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            createNewBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: createNewBtn.topAnchor, constant: -10),
            
            descriptionTV.heightAnchor.constraint(equalToConstant: 15),
            descriptionTV.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTV.bottomAnchor.constraint(equalTo: createNewBtn.topAnchor, constant: -90),
            
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.bottomAnchor.constraint(equalTo: descriptionTV.topAnchor, constant: -5),
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            image.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -50),
            image.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCollectionView(with clients: [Client]) {
        image.isHidden = true
        collectionView.isHidden = false
        descriptionTV.isHidden = true
        title.isHidden = true
        self.clients = clients
        collectionView.reloadData()
    }
    
}

extension ClientView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ClientViewCell.cellIdentifier,
            for: indexPath
        ) as? ClientViewCell else {
            fatalError("Unsupported cell")
        }
        let client = clients[indexPath.row]
        cell.configure(with: client)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-70
        return CGSize(width: width, height: 70)
    }
    
}
