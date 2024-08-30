//
//  StatisticsViewController.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import UIKit

protocol StatisticsViewProtocol: AnyObject {
    var presenter: StatisticsPresenterProtocol? { get set }
    
    func retrieveProjects(with projects: [Project])
    
    func showError(_ error: Error)
}

class StatisticsViewController: UIViewController, StatisticsViewProtocol {
    
    private var statistics: [StatisticsModel] = []
    
    func retrieveProjects(with projects: [Project]) {
        let completedProjects = projects.filter({ it in it.completed})
        
        var tasks: [FjTask] = []
        completedProjects.forEach({ project in
            tasks.append(contentsOf: project.task?.allObjects as! [FjTask])
        })
        
        var earnings: Float = 0
        
        tasks.forEach({ task in
            earnings += task.price
        })
        
        statistics.append(StatisticsModel(label: "Earn for all time: ", value: String(earnings)))
        statistics.append(StatisticsModel(label: "Completed for all time: ", value: String(completedProjects.count)))
        statistics.append(StatisticsModel(label: "Number of clients for all time:", value: String(completedProjects.count)))
        statisticsView.configureCollectionView(with: statistics)
    }
    
    func showError(_ error: any Error) {
        print("Error \(error.localizedDescription)")
    }
    
    private let statisticsView = StatisticsView()
    var presenter: StatisticsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView(statisticsView)
        view.backgroundColor = .systemCyan
    }
    
}
