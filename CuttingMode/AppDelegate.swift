//
//  AppDelegate.swift
//  CuttingMode
//
//  Created by Artyom on 20.11.21.
//

import UIKit
import GeneralModule
import UIModule

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = NavigatorAssembly.rootController
        window.makeKeyAndVisible()
        self.window = window

        let coordinator = GeneralCoordinator(navigator: NavigatorAssembly.defaultNavigator)
        coordinator.start(with: .main, animated: false, completion: nil)

        return true
    }
}
