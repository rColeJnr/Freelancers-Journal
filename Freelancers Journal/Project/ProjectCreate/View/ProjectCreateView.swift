//
//  ProjectCreateView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectCreateView: UIView {
    
    private let nameLabel = {
        let view = UILabel()
        view.text = "Name"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameTF = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemTeal
        view.textColor = .white
        view.textAlignment = .left
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
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
        view.isEditable = true
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemTeal
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
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deadlineTV = {
        let view = UITextView()
        view.accessibilityHint = "Deadline"
        view.isEditable = false
        view.isUserInteractionEnabled = false
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemTeal
        view.textColor = .white
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priorityLabel = {
        let view = UILabel()
        view.text = "Priority"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priorityYesBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Yes"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .red
        return view
    }()
        
    private let priorityNoBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "No"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .red
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let difficultyLabel = {
        let view = UILabel()
        view.text = "Difficulty of execution"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let diffEasyBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Easy"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGreen
        return view
    }()
        
    private let diffMediumBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Medium"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .orange
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let diffHardBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Hard"
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 15
        return view
    }()
      
    let datePickerView = {
        let view = UIDatePicker()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.datePickerMode = .date
        return view
    }()

     
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    
        configBtns()
        configDatePicker()
        
        addSubviews(datePickerView, nameLabel, nameTF, descriptionLabel, descritionTV, deadlineLabel, deadlineTV, priorityLabel, priorityYesBtn, priorityNoBtn, difficultyLabel, diffEasyBtn, diffMediumBtn, diffHardBtn)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Add gesture recognizers to ui buttons
    private func configBtns() {
        priorityYesBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setPriorityYes(_ :))))
        priorityNoBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setPriorityNo(_ :))))
        diffEasyBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setDiffEasy(_ :))))
        diffMediumBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setDiffMedium(_ :))))
        diffHardBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setDiffHard(_ :))))
    }
    
    /// Setup deadline text view date picker view
    private func configDatePicker() {
        datePickerView.addTarget(self, action: #selector(setDeadline), for: .valueChanged)
        deadlineTV.text = datePickerView.date.formatted(date: .abbreviated, time: .omitted)
        deadlineTV.inputView = datePickerView
    }
    
    private func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }
    
    @objc private func setDeadline(_ sender: UIDatePicker) {
        deadlineTV.text = getDateFormatter().string(from: sender.date)
    }
    
    private var chosenPriority: Bool? = nil
    private var chosenDifficulty: String? = nil
    
    @objc private func setPriorityYes(_ sender: Any) {
        priorityNoBtn.backgroundColor = .red
        priorityYesBtn.backgroundColor = .systemBlue
        chosenPriority = true
    }
    
    @objc private func setPriorityNo(_ sender: Any) {
        priorityNoBtn.backgroundColor = .systemBlue
        priorityYesBtn.backgroundColor = .red
        chosenPriority = false
    }

    @objc private func setDiffEasy(_ sender: Any) {
        diffEasyBtn.backgroundColor = .systemBlue
        diffMediumBtn.backgroundColor = .orange
        diffHardBtn.backgroundColor = .red
        chosenDifficulty = "Easy"
    }

    @objc private func setDiffMedium(_ sender: Any) {
        diffEasyBtn.backgroundColor = .green
        diffMediumBtn.backgroundColor = .systemBlue
        diffHardBtn.backgroundColor = .red
        chosenDifficulty = "Medium"
    }
    
    @objc private func setDiffHard(_ sender: Any) {
        diffEasyBtn.backgroundColor = .systemGreen
        diffMediumBtn.backgroundColor = .orange
        diffHardBtn.backgroundColor = .systemBlue
        chosenDifficulty = "Hard"
    }
    
    func canMoveNext() -> ProjectModel? {
        guard
            let name = nameTF.text,
            let description = descritionTV.text,
            let deadline = deadlineTV.text,
            let priority = chosenPriority,
            let difficulty = chosenDifficulty else {
            return nil
        }
        
        return ProjectModel(name: name, description: description, deadline: deadline, priority: priority, diff: difficulty, tasks: [], client: nil)
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
        
            datePickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePickerView.centerYAnchor.constraint(equalTo: deadlineTV.centerYAnchor)
        ])
    }
    
}
