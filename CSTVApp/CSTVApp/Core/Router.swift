//
//  Router.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation
import UIKit

public protocol RouterProtocol {
    var navigationController: UINavigationController { get set }
    func present(_ module: Presentable, isAnimated: Bool)
    func present(_ module: Presentable, transitionSubType: CATransitionSubtype)
    func push(_ module: Presentable, isAnimated: Bool)
    
    func pop(_ isAnimated: Bool)
    func dismiss(_ isAnimated: Bool)
    func dismiss(_ isAnimated: Bool, completion: (() -> Void)?)
    func dismiss(transitionSubType: CATransitionSubtype)
    func setViewControllers(modules: [Presentable], isAnimated: Bool)
}

public class Router: RouterProtocol {
    
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    public func present(_ module: Presentable, isAnimated: Bool) {
        module.modalPresentationStyle = .fullScreen
        navigationController.present(module.toPresent(), animated: isAnimated)
    }
    
    public func present(_ module: Presentable, transitionSubType: CATransitionSubtype) {
        module.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = transitionSubType
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        navigationController.view.window?.layer.add(transition, forKey: kCATransition)
        
        navigationController.present(module.toPresent(), animated: false)
    }
    
    public func push(_ module: Presentable, isAnimated: Bool) {
        navigationController.pushViewController(module.toPresent(), animated: isAnimated)
    }
    
    public func pop(_ isAnimated: Bool = true) {
        navigationController.popViewController(animated: isAnimated)
    }
    
    public func dismiss(_ isAnimated: Bool = true) {
        navigationController.dismiss(animated: isAnimated)
    }
    
    public func dismiss(transitionSubType: CATransitionSubtype) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = transitionSubType
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        navigationController.view.window?.layer.add(transition, forKey: kCATransition)
        
        navigationController.dismiss(animated: false)
    }
    
    public func dismiss(_ isAnimated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: isAnimated, completion: completion)
    }
    
    public func setViewControllers(modules: [Presentable], isAnimated: Bool) {
        navigationController.setViewControllers(modules.compactMap({ $0.toPresent() }), animated: isAnimated)
    }
}
