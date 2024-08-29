//
//  FjTabBarController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

class FjTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let homeVc = HomeViewController()
        let statisticsVc = StatisticsViewController()
        let clientsVc = ClientsViewController()
        let settingsVc = SettingsViewController()
        
        homeVc.navigationItem.largeTitleDisplayMode = .inline
        statisticsVc.navigationItem.largeTitleDisplayMode = .inline
        clientsVc.navigationItem.largeTitleDisplayMode = .inline
        settingsVc.navigationItem.largeTitleDisplayMode = .inline
    
        let homeNav = UINavigationController(rootViewController: homeVc)
        let statisticsNav = UINavigationController(rootViewController: statisticsVc)
        let clientsNav = UINavigationController(rootViewController: clientsVc)
        let settingsNav = UINavigationController(rootViewController: settingsVc)
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 1)
        statisticsNav.tabBarItem = UITabBarItem(title: "Statistics", image: UIImage(systemName: "chart.bar"), tag: 2)
        clientsNav.tabBarItem = UITabBarItem(title: "Clients", image: UIImage(systemName: "person.3.fill"), tag: 3)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([homeNav, statisticsNav, clientsNav, settingsNav], animated: true)
        
    }
    
}
