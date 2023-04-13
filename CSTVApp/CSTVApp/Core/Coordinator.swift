//
//  Coordinator.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var router: RouterProtocol { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

public extension Coordinator {
    func childDidFinish(_ coordinator : Coordinator){
        for (index, child) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
