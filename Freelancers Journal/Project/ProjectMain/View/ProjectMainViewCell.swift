//
//  HomeViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(name, date, price)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 350),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            date.widthAnchor.constraint(equalToConstant: 350),
            date.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            price.widthAnchor.constraint(equalToConstant: 250),
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
        ])
    }
    
    func configure(with project: Project) {
        name.text = project.name
        date.text = project.date?.description
        price.text = "\(project.price) $"
    }
    
}
