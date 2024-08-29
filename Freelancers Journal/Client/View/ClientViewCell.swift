//
//  ClientViewCell.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//
import UIKit

class ClientViewCell: UICollectionViewCell {
    static let cellIdentifier = "ClientViewCell"
    
    let name = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.textColor = .white
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(name)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: 90),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
    
    func configure(with client: Client) {
        name.text = client.name
    }
    
}
