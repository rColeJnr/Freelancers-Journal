//
//  SettingsView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//
 import UIKit

class SettingsView: UIView {
    
    private let devBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Developer's website"
        viewConfig.image = UIImage(systemName: "arrow.forward.square")
        viewConfig.imagePlacement = .trailing
        viewConfig.imagePadding = 20
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = appColor()
        view.layer.cornerRadius = 15
        return view
    }()
    private let rateUsBtn = {
        var viewConfig = UIButton.Configuration.bordered()
        viewConfig.title = "Rate us"
        viewConfig.image = UIImage(systemName: "arrow.forward.square")
        viewConfig.imagePlacement = .trailing
        viewConfig.imagePadding = 20
        viewConfig.baseForegroundColor = .white
        let view = UIButton(configuration: viewConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = appColor()
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let image = {
        let view = UIImageView()
        view.image = .settings
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(image, rateUsBtn, devBtn)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            devBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            devBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            devBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            devBtn.heightAnchor.constraint(equalToConstant: 60),
            
            rateUsBtn.bottomAnchor.constraint(equalTo: devBtn.topAnchor, constant: -30),
            rateUsBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rateUsBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            rateUsBtn.heightAnchor.constraint(equalToConstant: 60),
            
            image.bottomAnchor.constraint(equalTo: rateUsBtn.topAnchor, constant: -60),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 30),
        ])
    }
}
