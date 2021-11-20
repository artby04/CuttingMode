//
//  GeneralCoordinator.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import Foundation
import UIModule

public final class GeneralCoordinator: Coordinatable {
    

    private let navigator: Navigating

    public init(navigator: Navigating) {
        self.navigator = navigator

        self.navigator.delegate = self
    }

    public enum DeepLink {
        case main
    }

    public func start(with option: GeneralCoordinator.DeepLink, animated: Bool, completion: (() -> Void)?) {
        switch option {
        case .main:
            showMain(animated: animated, completion: completion)
        }
    }

    public func didRequestCloseModule(animated: Bool) {
        navigator.dismissModule(animated: animated)
    }

    public func didRequestCloseModule(animated: Bool, completion: (() -> Void)?) {
        navigator.dismissModule(animated: animated, completion: completion)
    }

    func showMain(animated: Bool, completion: (() -> Void)?) {
        let moduleInfo = MainModuleConfigurator().configure(router: self)

        let presentable = moduleInfo.view.toPresent()
        presentable.title = "Режимы резания"
        navigator.push(presentable, animated: animated, completion: completion)
    }
}

extension GeneralCoordinator: NavigatorDelegate {
    public func willFinishSwipeModule() {
        print("GeneralCoordinator.willFinishSwipeModule. Module will finish swipe")
    }
}

extension GeneralCoordinator: MainModuleOutput {}
