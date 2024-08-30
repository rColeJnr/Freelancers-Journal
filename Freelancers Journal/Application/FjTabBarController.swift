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
        let projectVc = ProjectMainRouter().createModule()
        let statisticsVc = StatisticsRouter().createModule()
        let clientsVc = ClientRouter().createModule(for: nil)
        let settingsVc = SettingsViewController()
        
        projectVc.navigationItem.largeTitleDisplayMode = .inline
        statisticsVc.navigationItem.largeTitleDisplayMode = .inline
        clientsVc.navigationItem.largeTitleDisplayMode = .inline
        settingsVc.navigationItem.largeTitleDisplayMode = .inline
    
        let projectNav = UINavigationController(rootViewController: projectVc)
        let statisticsNav = UINavigationController(rootViewController: statisticsVc)
        let clientsNav = UINavigationController(rootViewController: clientsVc)
        let settingsNav = UINavigationController(rootViewController: settingsVc)
        
        projectNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 1)
        statisticsNav.tabBarItem = UITabBarItem(title: "Statistics", image: UIImage(systemName: "chart.bar"), tag: 2)
        clientsNav.tabBarItem = UITabBarItem(title: "Clients", image: UIImage(systemName: "person.3"), tag: 3)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([projectNav, statisticsNav, clientsNav, settingsNav], animated: true)

        tabBar.backgroundColor = appColor()
        
    }
    
}

// Пожалуйста игноруй это
func appColor() -> UIColor {
    let rgbValue = 0x3B2B4C
    let r = CGFloat((rgbValue & 0xFF0000) >> 16)/255.0
    let g = CGFloat((rgbValue & 0xFF00) >> 8)/255.0
    let b = CGFloat((rgbValue & 0xFF))/255.0
    return UIColor(red:r, green: g, blue: b, alpha: 1.0)
}
