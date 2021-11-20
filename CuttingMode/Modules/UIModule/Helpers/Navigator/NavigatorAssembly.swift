//
//  NavigatorAssembly.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public enum NavigatorAssembly {
    public static let rootController: CustomNavigationController = CustomNavigationController()
    public static var defaultNavigator: Navigating {
        return Navigator(rootController: rootController)
    }
}
