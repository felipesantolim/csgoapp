//
//  FeedCoordinator.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

// MARK: - Coordinator protocol

import Foundation

protocol FeedCoordinatorProtocol: Coordinator {
    func goToDetail()
}

// MARK: - Coordinator implementation

class FeedCoordinator: FeedCoordinatorProtocol {
    
    // MARK: - Properties
    
    weak var parentCoordinator: Coordinator?
    var router: RouterProtocol
    var childCoordinators: [Coordinator]
    private let requestProvier: RequestProviderProtocol
    
    // MARK: - Life Cycle
    
    init(router: RouterProtocol, requestProvider: RequestProviderProtocol) {
        self.router = router
        self.childCoordinators = []
        self.requestProvier = requestProvider
    }
    
    // MARK: - Private functions
    
    public func start() {
        let repository = FeedRepository(requestProvider: requestProvier)
        let viewModel = FeedViewModel(repository: repository)
        let feedViewController = FeedViewController(viewModel: viewModel, coordinator: self)
        
        router.setViewControllers(modules: [feedViewController], isAnimated: true)
        parentCoordinator?.router.present(router.navigationController, isAnimated: false)
    }
    
    public func goToDetail() {
        let viewModel = DetailViewModel()
        let detailViewController = DetailViewController(viewModel: viewModel, coordinator: self)
        
        router.push(detailViewController, isAnimated: true)
    }
}
