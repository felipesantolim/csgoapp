//
//  DetailCoordinator.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 12/04/23.
//

// MARK: - Coordinator protocol

import Foundation

protocol DetailCoordinatorProtocol: Coordinator {
}

// MARK: - Coordinator implementation

class DetailCoordinator: DetailCoordinatorProtocol {
    
    // MARK: - Properties
    
    weak var parentCoordinator: Coordinator?
    var router: RouterProtocol
    var childCoordinators: [Coordinator]
    
    // MARK: - Life Cycle
    
    init(router: RouterProtocol) {
        self.router = router
        self.childCoordinators = []
    }
    
    // MARK: - Private functions
    
    public func start() {
        
    }
}
