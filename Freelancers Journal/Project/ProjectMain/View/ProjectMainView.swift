//
//  HomeView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectMainViewDelegate {
    func navigateToCreateProject()
    func createProjectDetailsModule(for project: Project)
    
    func showCompletedProjects()
    func showInProgressProjects()
}

class ProjectMainView: UIView {
    
    private var projects: [Project] = []
    var delegate: ProjectMainViewDelegate?
    
    // MARK: - VIEWS
    
    private let inProgressBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "In Progress"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.isHidden = true
        view.backgroundColor = .blue
        view.isEnabled = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let completedBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Completed"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.isHidden = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let image = {
        let view = UIImageView()
        view.image = UIImage( named: "notebook")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title = {
        let view = UILabel()
        view.text = "You don't have any projects yet"
        view.font = .systemFont(ofSize: 26, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionTV = {
        let view = UILabel()
        view.text = "Create one now"
        view.font = .systemFont(ofSize: 18, weight: .medium)
        view.textColor = .white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let createNewBtn = {
        let view = UIImageView()
        view.image = UIImage( named: "circle_add_btn")
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProjectMainViewCell.self, forCellWithReuseIdentifier: ProjectMainViewCell.cellIdentifier)
        view.backgroundColor = .systemCyan
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false    
        createNewBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCreateNewBtnClick(_ :))))
        completedBtn.addTarget(self, action: #selector(onCompletedBtnClick), for: .touchDown)
        inProgressBtn.addTarget(self, action: #selector(onInProgressBtnClick), for: .touchDown)
        
        addSubviews(inProgressBtn, completedBtn, image, title, descriptionTV, createNewBtn, collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            inProgressBtn.widthAnchor.constraint(equalToConstant: 170),
            inProgressBtn.heightAnchor.constraint(equalToConstant: 40),
            inProgressBtn.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            inProgressBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            completedBtn.widthAnchor.constraint(equalToConstant: 170),
            completedBtn.heightAnchor.constraint(equalToConstant: 40),
            completedBtn.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            completedBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            createNewBtn.heightAnchor.constraint(equalToConstant: 70),
            createNewBtn.widthAnchor.constraint(equalToConstant: 70),
            createNewBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120),
            createNewBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: inProgressBtn.bottomAnchor, constant: 10),
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
    
    @objc private func onCreateNewBtnClick(_ sender: Any) {
        delegate?.navigateToCreateProject()
    }
    
    @objc private func onCompletedBtnClick(_ sender: UIButton) {
        completedBtn.backgroundColor = .blue
        inProgressBtn.backgroundColor = .systemTeal
        completedBtn.isEnabled = false
        inProgressBtn.isEnabled = true
        delegate?.showCompletedProjects()
    }
    
    @objc private func onInProgressBtnClick(_ sender: UIButton) {
        inProgressBtn.backgroundColor = .blue
        completedBtn.backgroundColor = .systemTeal
        completedBtn.isEnabled = true
        inProgressBtn.isEnabled = false
        delegate?.showInProgressProjects()
    }
    
    func selectInProgressBtn() {
        completedBtn.backgroundColor = .systemTeal
        inProgressBtn.backgroundColor = .blue
        completedBtn.isEnabled = true
        inProgressBtn.isEnabled = false
    }
    
    func configureCollectionView(with projects: [Project]) {
        self.projects = projects
        collectionView.isHidden = false
        inProgressBtn.isHidden = false
        completedBtn.isHidden = false
        image.isHidden = true
        descriptionTV.isHidden = true
        title.isHidden = true
        collectionView.reloadData()
    }
}

extension ProjectMainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProjectMainViewCell.cellIdentifier,
            for: indexPath
        ) as? ProjectMainViewCell else {
            fatalError("Unsupported cell")
        }
        let project = projects[indexPath.row]
        cell.configure(with: project)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-30
        return CGSize(width: width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        delegate?.createProjectDetailsModule(for: project)
    }
    
    
}
