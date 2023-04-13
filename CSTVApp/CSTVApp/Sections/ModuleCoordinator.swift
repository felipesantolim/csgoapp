//
//  ModuleCoordinator.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public class ModuleCoordinator: Coordinator {
    
    public var router: RouterProtocol
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    private let requestProvider: RequestProviderProtocol
    
    public required init(router: RouterProtocol, requestProvider: RequestProviderProtocol) {
        self.router = router
        self.requestProvider = requestProvider
    }
    
    public func start() {
        let feedCoordinator = FeedCoordinator(router: router, requestProvider: requestProvider)
        feedCoordinator.start()
        childCoordinators.append(feedCoordinator)
    }
}
