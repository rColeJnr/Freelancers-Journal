//
//  ProjectDetailsTaskViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import UIKit

class ProjectDetailsTaskViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProjectDetailsTaskViewCell"
    
    private let task = {
        let view = UILabel()
        view.text = "UI/UX"
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "info_value")!)
        view.textColor = .white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(task)
        contentView.layer.cornerRadius = 15
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            task.topAnchor.constraint(equalTo: contentView.topAnchor),
            task.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            task.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10),
            task.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
        ])
    }
    
    func configure(with task: FjTask) {
        self.task.text = task.name
    }
    
}
