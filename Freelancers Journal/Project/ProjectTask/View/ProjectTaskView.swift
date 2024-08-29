//
//  ProjectTaskView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectTaskView: UIView {
    
    var taskList: [FjTask] = []
    
    let createNewBtn = {
        let view = UIImageView()
        view.image = UIImage( named: "circle_add_btn")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(HomeViewCell.self, forCellWithReuseIdentifier: HomeViewCell.cellIdentifier)
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(createNewBtn, collectionView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            createNewBtn.heightAnchor.constraint(equalToConstant: 70),
            createNewBtn.widthAnchor.constraint(equalToConstant: 70),
            createNewBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 140),
            createNewBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: createNewBtn.topAnchor, constant: -10),
            
        ])
    }
    
}

extension ProjectTaskView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProjectTaskViewCell.cellIdentifier,
            for: indexPath
        ) as? ProjectTaskViewCell else {
            fatalError("Unsupported cell")
        }
        let task = taskList[indexPath.row]
        cell.configure(with: task)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-30
        return CGSize(width: width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // selection
    }
    
    
}
