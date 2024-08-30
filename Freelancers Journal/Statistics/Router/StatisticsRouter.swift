//
//  StatisticsRouter.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

protocol StatisticsRouterProtocol {

    func createModule() -> StatisticsViewController
}

class StatisticsRouter: StatisticsRouterProtocol {
        
    func createModule() -> StatisticsViewController {
        let view = StatisticsViewController()
        var interactor: StatisticsInteractorProtocol & StatisticsDataManagerResponseProtocol = StatisticsInteractor()
        var presenter: StatisticsPresenterProtocol & StatisticsInteractorResponseProtocol = StatisticsPresenter()
        let statisticsDataManager: StatisticsDataManagerProtocol = StatisticsDataManager()
        let router: StatisticsRouterProtocol = StatisticsRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.statisticsDataManager = statisticsDataManager
        presenter.router = router
        view.title = "Statistics"
        return view
    }
    
}
