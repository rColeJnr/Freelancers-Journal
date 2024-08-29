//
//  ProjectCreateView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectCreateView: UIView {    
    
    let nameLabel = {
        let view = UILabel()
        view.text = "Name"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTF = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
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
        view.isEditable = true
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deadlineLabel = {
        let view = UILabel()
        view.text = "Deadline"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deadlineTV = {
        let view = UITextView()
        view.isEditable = false
        view.isUserInteractionEnabled = true
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priorityLabel = {
        let view = UILabel()
        view.text = "Priority"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priorityYesBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Yes"
        viewConfig.baseBackgroundColor = .systemRed
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
        
    let priorityNoBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "No"
        viewConfig.baseBackgroundColor = .systemRed
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    let difficultyLabel = {
        let view = UILabel()
        view.text = "Difficulty of execution"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let diffEasyBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Easy"
        viewConfig.baseBackgroundColor = .systemGreen
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
        
    let diffMediumBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Medium"
        viewConfig.baseBackgroundColor = .systemOrange
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
    
        
    let diffHardBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Hard"
        viewConfig.baseBackgroundColor = .systemRed
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(nameLabel, nameTF, descriptionLabel, descritionTV, deadlineLabel, deadlineTV, priorityLabel, priorityYesBtn, priorityNoBtn, difficultyLabel, diffEasyBtn, diffMediumBtn, diffHardBtn)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            diffEasyBtn.heightAnchor.constraint(equalToConstant: 50),
            diffEasyBtn.widthAnchor.constraint(equalToConstant: 115),
            diffEasyBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            diffEasyBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                
            diffMediumBtn.heightAnchor.constraint(equalToConstant: 50),
            diffMediumBtn.widthAnchor.constraint(equalToConstant: 115),
            diffMediumBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            diffMediumBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            diffHardBtn.heightAnchor.constraint(equalToConstant: 50),
            diffHardBtn.widthAnchor.constraint(equalToConstant: 115),
            diffHardBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            diffHardBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            difficultyLabel.heightAnchor.constraint(equalToConstant: 30),
            difficultyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            difficultyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            difficultyLabel.bottomAnchor.constraint(equalTo: diffEasyBtn.topAnchor, constant: -10),
            
            priorityYesBtn.heightAnchor.constraint(equalToConstant: 50),
            priorityYesBtn.widthAnchor.constraint(equalToConstant: 170),
            priorityYesBtn.bottomAnchor.constraint(equalTo: difficultyLabel.topAnchor, constant: -20),
            priorityYesBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            priorityNoBtn.heightAnchor.constraint(equalToConstant: 50),
            priorityNoBtn.widthAnchor.constraint(equalToConstant: 170),
            priorityNoBtn.bottomAnchor.constraint(equalTo: difficultyLabel.topAnchor, constant: -20),
            priorityNoBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            priorityLabel.heightAnchor.constraint(equalToConstant: 30),
            priorityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priorityLabel.bottomAnchor.constraint(equalTo: priorityYesBtn.topAnchor, constant: -10),
            
            deadlineTV.heightAnchor.constraint(equalToConstant: 60),
            deadlineTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deadlineTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deadlineTV.bottomAnchor.constraint(equalTo: priorityLabel.topAnchor, constant: -20),
            
            deadlineLabel.heightAnchor.constraint(equalToConstant: 30),
            deadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deadlineLabel.bottomAnchor.constraint(equalTo: deadlineTV.topAnchor, constant: -5),
            
            descritionTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descritionTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descritionTV.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -20),
            descritionTV.bottomAnchor.constraint(equalTo: deadlineLabel.topAnchor, constant: -20),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: -20),
            
            nameTF.heightAnchor.constraint(equalToConstant: 60),
            nameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
        ])
    }
    
}
