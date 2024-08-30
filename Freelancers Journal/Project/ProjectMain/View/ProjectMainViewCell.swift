//
//  HomeViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class ProjectMainViewCell: UICollectionViewCell {
    static let cellIdentifier = "HomeViewCell"
    
    let name = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let date = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let price = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(name, date, price)
        contentView.backgroundColor = appColor()
        contentView.layer.cornerRadius = 15
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            price.heightAnchor.constraint(equalToConstant: 30),
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10),
            
            name.heightAnchor.constraint(equalToConstant: 30),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            date.heightAnchor.constraint(equalToConstant: 30),
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
        ])
    }
    
    func configure(with project: Project) {
        let priceText = {
            var sum: Float = 0
            for value in project.task! {
                sum += (value as! FjTask).price
            }
            return sum
        }()
        name.text = project.name
        date.text = project.deadline
        price.text = "\(String(describing: priceText)) $"
    }
    
}
