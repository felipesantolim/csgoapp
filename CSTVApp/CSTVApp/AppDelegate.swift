//
//  AppDelegate.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 12/04/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var moduleCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController.init()
        let router = Router(navigationController: navigationController)
        moduleCoordinator = FeedCoordinator(router: router, requestProvider: FeedProvider())
        moduleCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

