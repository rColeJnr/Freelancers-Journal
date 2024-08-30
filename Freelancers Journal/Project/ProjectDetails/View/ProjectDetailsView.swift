//
//  ProjectDetailsView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import UIKit

protocol ProjectDetailsViewDelegate {
    func onDeleteClick(project: Project)
    func onCompleteClick(project: Project)
}

class ProjectDetailsView: UIView {
    
    private let deleteBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Delete"
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemOrange
        view.tintColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let completeBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let priorityProject = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Priority Project"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let descriptionLabel = {
        let view = UILabel()
        view.text = "Description"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descritionTV = {
        let view = UITextView()
        view.isEditable = false
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deadlineLabel = {
        let view = UILabel()
        view.text = "Deadline"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "info_value")!)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deadlineValue = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diffLabel = {
        let view = UILabel()
        view.text = "Difficulty"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "info_value")!)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diffValue = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tasksLabel = {
        let view = UILabel()
        view.text = "Tasks"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let taskView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProjectDetailsTaskViewCell.self, forCellWithReuseIdentifier: ProjectDetailsTaskViewCell.cellIdentifier)
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private let clientLabel = {
        let view = UILabel()
        view.text = "Client"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let client = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "client_regular")!)
        view.textColor = .white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        taskView.delegate = self
        taskView.dataSource = self
        deleteBtn.addTarget(self, action: #selector(onDeleteClick(_ :)), for: .touchDown)
        completeBtn.addTarget(self, action: #selector(onCompleteClick(_ :)), for: .touchDown)
        addSubviews(deleteBtn, completeBtn, client, clientLabel, taskView, tasksLabel, diffValue, diffLabel, deadlineLabel, deadlineValue, descritionTV, descriptionLabel, priorityProject)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View configuration
    
    var delegate: ProjectDetailsViewDelegate?
    
    @objc private func onDeleteClick(_ sender : Any) {
        self.delegate?.onDeleteClick(project: self.project)
    }
    
    @objc private func onCompleteClick(_ sender : Any) {
        completeBtn.backgroundColor = if project.completed {
            .green
        } else {
            .blue
        }
        delegate?.onCompleteClick(project: project)
    }
    
    var taskList: [FjTask] = []
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            priorityProject.heightAnchor.constraint(equalToConstant: 60),
            priorityProject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priorityProject.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priorityProject.topAnchor.constraint(equalTo: topAnchor, constant: 10),
  
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: priorityProject.bottomAnchor, constant: 10),
              
            descritionTV.heightAnchor.constraint(equalToConstant: 90),
            descritionTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descritionTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descritionTV.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
                       
            deadlineValue.heightAnchor.constraint(equalToConstant: 60),
            deadlineValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deadlineValue.topAnchor.constraint(equalTo: descritionTV.bottomAnchor, constant: 20),
           
            deadlineLabel.heightAnchor.constraint(equalToConstant: 60),
            deadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deadlineLabel.topAnchor.constraint(equalTo: descritionTV.bottomAnchor, constant: 20),
                                                      
            diffValue.heightAnchor.constraint(equalToConstant: 60),
            diffValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            diffValue.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor, constant: 10),
            
            diffLabel.heightAnchor.constraint(equalToConstant: 60),
            diffLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            diffLabel.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor, constant: 10),
                         
            tasksLabel.heightAnchor.constraint(equalToConstant: 30),
            tasksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tasksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tasksLabel.topAnchor.constraint(equalTo: diffLabel.bottomAnchor, constant: 10),
            
            taskView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            taskView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            taskView.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor, constant: 5),
            taskView.bottomAnchor.constraint(equalTo: clientLabel.topAnchor, constant: -5),

            clientLabel.heightAnchor.constraint(equalToConstant: 30),
            clientLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            clientLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            clientLabel.bottomAnchor.constraint(equalTo: client.topAnchor, constant: -10),
            
            client.heightAnchor.constraint(equalToConstant: 50),
            client.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            client.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            client.bottomAnchor.constraint(equalTo: deleteBtn.topAnchor, constant: -20),
            
            deleteBtn.heightAnchor.constraint(equalToConstant: 60),
            deleteBtn.widthAnchor.constraint(equalToConstant: 170),
            deleteBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            completeBtn.heightAnchor.constraint(equalToConstant: 60),
            completeBtn.widthAnchor.constraint(equalToConstant: 170),
            completeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            completeBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
        ])
    }
    
    var project: Project!
    func configure(with project: Project?){
        guard let project = project else {
            return
        }
        self.project = project
        priorityProject.backgroundColor = if project.priority {
            .red
        } else {
            .orange
        }
        priorityProject.configuration?.title = if project.priority {
            "Priority Project"
        } else {
            "Not Priority Project"
        }
        completeBtn.backgroundColor = if project.completed {
            .green
        } else {
            .blue
        }
        completeBtn.configuration?.title = if project.completed {
            "Mark in progress"
        } else {
            "Mark as complete"
        }
        descritionTV.text = project.details
        deadlineValue.text = project.deadline
        diffValue.text = project.difficulty
        taskList = project.task?.allObjects as! [FjTask]
        client.text = project.client?.name
        
    }
    
}

extension ProjectDetailsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProjectDetailsTaskViewCell.cellIdentifier,
            for: indexPath
        ) as? ProjectDetailsTaskViewCell else {
            fatalError("Unsupported cell")
        }
        let task = taskList[indexPath.row]
        cell.configure(with: task)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 40)
    }
}
