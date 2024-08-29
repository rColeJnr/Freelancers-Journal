//
//  OnboardingViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol NavigateToSecondOnboardingScreenDelegate: AnyObject {
    func navigateToSecondScreen()
}

class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupView(onboardingView)
        onboardingView.collectionView?.delegate = self
        onboardingView.collectionView?.dataSource = self
        onboardingView.collectionView?.backgroundColor = .systemCyan
        
    }
    
    func navigateToSecondScreen() {
        // MARK: TODO not yet implemented
    }
    
}

extension OnboardingViewController: FirstOnboardingViewCellDelegate, SecondOnboardingViewCellDelegate {
    func showSecondOnboardingView() {
        let indexPath = IndexPath(item: 0, section: 1)
        self.onboardingView.collectionView?.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    func navigateToHomeController() {
        FjIsNewUser.shared.setNotIsNewUSer()
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FjOnboardingScreen.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = FjOnboardingScreen.allCases[indexPath.section]
        
        switch sectionType {
        case .FirstScreen:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FirstOnboardingViewCell.cellIdentifier,
                for: indexPath
            ) as? FirstOnboardingViewCell else {
                fatalError()
            }
            cell.delegate = self
            return cell
        case .SecondScreen:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SecondOnboardingViewCell.cellIdentifier,
                for: indexPath
            ) as? SecondOnboardingViewCell else {
                fatalError()
            }
            cell.delegate = self
            return cell
        }
    }
}
