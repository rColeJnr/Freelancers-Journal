//
//  StatisticsPresenter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

protocol StatisticsPresenterProtocol {
    var view: StatisticsViewProtocol? { get set }
    var interactor: StatisticsInteractorProtocol? { get set }
    var router: StatisticsRouterProtocol? { get set }
    
    func viewDidLoad()
}

class StatisticsPresenter: StatisticsPresenterProtocol {
    weak var view: StatisticsViewProtocol?
    var interactor: StatisticsInteractorProtocol?
    var router: StatisticsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getProjects()
    }
}

extension StatisticsPresenter: StatisticsInteractorResponseProtocol {
    
    func didGetProjects(_ projects: [Project]) {
        view?.retrieveProjects(with: projects)
    }
    
    func didGetError(_ error: Error) {
        view?.showError(error)
    }
    
    
}
