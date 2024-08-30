//
//  StatisticsView.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

import UIKit

class StatisticsView: UIView {
    
    private var statistics: [StatisticsModel] = []
    // MARK: - VIEWS

    private let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(StatisticsViewCell.self, forCellWithReuseIdentifier: StatisticsViewCell.cellIdentifier)
        view.backgroundColor = .systemCyan
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configureCollectionView(with statistics: [StatisticsModel]) {
        self.statistics = statistics
        collectionView.reloadData()
    }
    
}

extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statistics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatisticsViewCell.cellIdentifier,
            for: indexPath
        ) as? StatisticsViewCell else {
            fatalError("Unsupported cell")
        }
        let statistic = statistics[indexPath.row]
        cell.configure(with: statistic)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-72
        return CGSize(width: width, height: 56)
    }
    
}

