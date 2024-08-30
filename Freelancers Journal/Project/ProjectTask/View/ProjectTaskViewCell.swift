//
//  ProjectTaskViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol ProjectTaskViewCellDelegate {
    func didChangeName(name: String?)
    func didChangePrice(price: String?)
}

class ProjectTaskViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProjectTaskViewCell"
    var delegate: ProjectTaskViewCellDelegate?
    
    // MARK: - Views
    private let title = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let name = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .blue
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let price = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.backgroundColor = .blue
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
        contentView.layer.cornerRadius = 15
        name.addTarget(self, action: #selector(onNameChange(_ :)), for: .editingChanged)
        price.addTarget(self, action: #selector(onPriceChange(_ :)), for: .editingChanged)
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
    
    // MARK: - Configuration
    
    func configure(with task: TaskModel) {
        title.text = task.title
    }
    
    @objc private func onNameChange(_ sender: Any) {
        delegate?.didChangeName(name: name.text)
    }
    
    @objc private func onPriceChange(_ sender: Any) {
        delegate?.didChangePrice(price: price.text)
    }
        
}
