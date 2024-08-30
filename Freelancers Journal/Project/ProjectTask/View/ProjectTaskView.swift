//
//  ProjectTaskView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit



class ProjectTaskView: UIView, ProjectTaskViewCellDelegate {
    
    var taskList: [TaskModel] = [
        TaskModel(title: "Task 1", name: nil, price: nil)
    ]
    
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
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProjectTaskViewCell.self, forCellWithReuseIdentifier: ProjectTaskViewCell.cellIdentifier)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        createNewBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(createNewTask(_ :))))
        addSubviews(createNewBtn, collectionView)
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
            createNewBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120),
            createNewBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: createNewBtn.topAnchor, constant: -10),
            
        ])
    }
    
    private var result: [TaskModel] = []
    private var taskName: String?
    private var taskPrice: String?
    
    func didChangeName(name: String?) {
        taskName = name
    }
    
    func didChangePrice(price: String?) {
        taskPrice = price
    }
    
    @objc private func createNewTask(_ sender: Any) {
        let count = taskList.count
        let indexPath = IndexPath(item: count-1, section: 0)
        guard collectionView.dequeueReusableCell(
            withReuseIdentifier: ProjectTaskViewCell.cellIdentifier,
            for: indexPath
        ) is ProjectTaskViewCell else {
            fatalError("Unsupported cell")
        }
    
        guard
            let name = taskName,
            let price = Float(taskPrice!) else {
                return
            }
        
        result.append(TaskModel(title: taskList[count-1].title, name: name, price: price))
        taskName = nil
        taskPrice = nil
        taskList.append(TaskModel(title: "Task \(count+1)", name: nil, price: nil))
        collectionView.reloadData()
        
    }
    func canMoveNext() -> [TaskModel]? {
        if taskName == nil || taskPrice == nil {
            return nil
        }
        if taskName!.isEmpty || taskPrice!.isEmpty {
            return nil
        }
        result.append(TaskModel(title: taskList.last?.title, name: taskName!, price: Float(taskPrice!)))
        return result
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
        cell.delegate = self
        cell.configure(with: task)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-30
        return CGSize(width: width, height: 150)
    }
    
}
