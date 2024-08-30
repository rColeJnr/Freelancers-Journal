//
//  ProjectDetailsView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import UIKit

class ProjectDetailsView: UIView {
    
    let deleteBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Delete"
        viewConfig.baseBackgroundColor = .systemOrange
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    let priorityProject = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Priority Project"
        viewConfig.baseBackgroundColor = .systemRed
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let descriptionLabel = {
        let view = UILabel()
        view.text = "Description"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descritionTV = {
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
    
    let deadlineStack = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = .greatestFiniteMagnitude
        return view
    }()
    
    let deadlineLabel = {
        let view = UILabel()
        view.text = "Deadline"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "info_value")!)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deadlineValue = {
        let view = UILabel()
        view.text = "12.12.2024"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let diffStack = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = .greatestFiniteMagnitude
        return view
    }()
    
    let diffLabel = {
        let view = UILabel()
        view.text = "Difficulty"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "info_value")!)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let diffValue = {
        let view = UILabel()
        view.text = "Medium"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tasksLabel = {
        let view = UILabel()
        view.text = "Tasks"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let taskStack = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        view.spacing = 10.0
        return view
    }()
    
    let taskView = {
        let view = UILabel()
        view.text = "UX/UI"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = .blue
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let clientLabel = {
        let view = UILabel()
        view.text = "Client"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let client = {
        let view = UILabel()
        view.text = "Aleksey"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "client_regular")!)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        deadlineStack.addArrangedSubview(deadlineLabel)
        deadlineStack.addArrangedSubview(deadlineValue)
        diffStack.addArrangedSubview(diffLabel)
        diffStack.addArrangedSubview(diffValue)
        taskStack.addArrangedSubview(taskView)
        addSubviews(deleteBtn, priorityProject, descriptionLabel, descritionTV, deadlineStack, diffStack, tasksLabel, taskStack, clientLabel, client)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            priorityProject.heightAnchor.constraint(equalToConstant: 60),
            priorityProject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priorityProject.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priorityProject.topAnchor.constraint(equalTo: topAnchor, constant: 10),
  
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: priorityProject.bottomAnchor, constant: 20),
              
            descritionTV.heightAnchor.constraint(equalToConstant: 120),
            descritionTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descritionTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descritionTV.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
                      
            deadlineStack.heightAnchor.constraint(equalToConstant: 60),
            deadlineStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deadlineStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deadlineStack.topAnchor.constraint(equalTo: descritionTV.bottomAnchor, constant: 30),
                              
            diffStack.heightAnchor.constraint(equalToConstant: 60),
            diffStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            diffStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            diffStack.topAnchor.constraint(equalTo: deadlineStack.bottomAnchor, constant: 20),
                         
            tasksLabel.heightAnchor.constraint(equalToConstant: 30),
            tasksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tasksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tasksLabel.topAnchor.constraint(equalTo: diffStack.bottomAnchor, constant: 20),                    
            
            taskStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            taskStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            taskStack.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor, constant: 10),
            taskStack.bottomAnchor.constraint(equalTo: clientLabel.topAnchor, constant: -30),
            
            clientLabel.heightAnchor.constraint(equalToConstant: 30),
            clientLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            clientLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            clientLabel.bottomAnchor.constraint(equalTo: client.topAnchor, constant: -10),
            
            client.heightAnchor.constraint(equalToConstant: 40),
            client.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            client.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            client.bottomAnchor.constraint(equalTo: deleteBtn.topAnchor, constant: -20),
            
            deleteBtn.heightAnchor.constraint(equalToConstant: 60),
            deleteBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deleteBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
        ])
    }
    
}
