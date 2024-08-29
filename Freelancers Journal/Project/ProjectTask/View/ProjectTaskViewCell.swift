//
//  ProjectTaskViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectTaskViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProjectTaskViewCell"
    
    let title = {
        let view = UILabel()
        view.text = "Task"
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let name = {
        let view = UITextView()
        view.text = "fdfdfdf"
        view.isEditable = true
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .blue
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let price = {
        let view = UITextView()
        view.text = "34554"
        view.isEditable = true
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .blue
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
        contentView.layer.cornerRadius = 15
        contentView.addSubviews(title, name, price)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -15),
            
            name.heightAnchor.constraint(equalToConstant: 40),
            name.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            price.heightAnchor.constraint(equalToConstant: 40),
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
        ])
    }
    
    func configure(with task: FjTask) {
        title.text = task.title
        name.text = task.name
        price.text = "\(task.price) $"
    }
    
    
}
