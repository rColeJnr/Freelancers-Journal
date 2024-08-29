//
//  ClientCreateView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ClientCreateView: UIView {
    
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
        view.keyboardType = .namePhonePad
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
    
    let phoneLabel = {
        let view = UILabel()
        view.text = "Phone number"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneTV = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.keyboardType = .phonePad
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailLabel = {
        let view = UILabel()
        view.text = "E-mail"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTV = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .systemBlue
        view.textColor = .white
        view.textAlignment = .left
        view.keyboardType = .emailAddress
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
      
    let regularLabel = {
        let view = UILabel()
        view.text = "A regular customer"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let regularYesBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Yes"
        viewConfig.baseBackgroundColor = .systemGreen
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 15
        return view
    }()
        
    let regularNoBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "No"
        viewConfig.baseBackgroundColor = .systemOrange
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
        addSubviews(nameLabel, nameTF, descriptionLabel, descritionTV, phoneLabel, phoneTV, emailLabel, emailTV, regularLabel, regularNoBtn, regularYesBtn)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            regularYesBtn.heightAnchor.constraint(equalToConstant: 50),
            regularYesBtn.widthAnchor.constraint(equalToConstant: 170),
            regularYesBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            regularYesBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            regularNoBtn.heightAnchor.constraint(equalToConstant: 50),
            regularNoBtn.widthAnchor.constraint(equalToConstant: 170),
            regularNoBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            regularNoBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            regularLabel.heightAnchor.constraint(equalToConstant: 30),
            regularLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            regularLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            regularLabel.bottomAnchor.constraint(equalTo: regularYesBtn.topAnchor, constant: -20),
            
            emailTV.heightAnchor.constraint(equalToConstant: 60),
            emailTV.bottomAnchor.constraint(equalTo: regularLabel.topAnchor, constant: -20),
            emailTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLabel.bottomAnchor.constraint(equalTo: emailTV.topAnchor, constant: -10),
            
            phoneTV.heightAnchor.constraint(equalToConstant: 60),
            phoneTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            phoneTV.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -20),
            
            phoneLabel.heightAnchor.constraint(equalToConstant: 30),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneLabel.bottomAnchor.constraint(equalTo: phoneTV.topAnchor, constant: -10),
            
            descritionTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descritionTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descritionTV.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -20),
            descritionTV.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -20),
            
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
