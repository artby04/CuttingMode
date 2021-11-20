//
//  Navigator.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public final class Navigator: NSObject {
    private weak var rootController: CustomNavigationController!

    public weak var delegate: NavigatorDelegate?

    public init(rootController: CustomNavigationController) {
        self.rootController = rootController
        super.init()

        rootController.interactivePopDelegate = self
    }

    // MARK: - Helpers

    private func findVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        if let presentedViewController = rootViewController.presentedViewController {
            return findVisibleViewController(presentedViewController)
        }

        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }

        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }

        return rootViewController
    }

    private func presentAt(_ viewController: UIViewController,
                           module: Presentable,
                           presentationStyle: UIModalPresentationStyle?,
                           animated: Bool) {
        presentModallyAt(viewController,
                         module: module,
                         animated: animated,
                         presentationStyle: presentationStyle,
                         transitionStyle: nil)
    }

    private func presentModallyAt(_ viewController: UIViewController,
                                  module: Presentable,
                                  animated: Bool,
                                  presentationStyle: UIModalPresentationStyle?,
                                  transitionStyle: UIModalTransitionStyle?,
                                  completion: (() -> Void)? = nil) {
        let controller = module.toPresent()

        if #available(iOS 13.0, *) {
            // To prevent modal controller gesture dismiss
            controller.isModalInPresentation = true
        }

        controller.modalPresentationCapturesStatusBarAppearance = true

        if let presentationStyle = presentationStyle {
            controller.modalPresentationStyle = presentationStyle
        }

        if let modalTransitionStyle = transitionStyle {
            controller.modalTransitionStyle = modalTransitionStyle
        }

        viewController.present(controller, animated: animated, completion: completion)
    }
}

// MARK: - Presentable

extension Navigator: Presentable {
    public func toPresent() -> UIViewController {
        return rootController
    }
}

// MARK: - Navigating

extension Navigator: Navigating {
    public var isPresenting: Bool {
        return rootController.presentedViewController != nil
    }

    public func present(_ module: Presentable, animated: Bool) {
        presentAt(rootController, module: module, presentationStyle: nil, animated: animated)
    }

    public func presentModally(_ module: Presentable, animated: Bool,
                               presentationStyle: UIModalPresentationStyle,
                               transitionStyle: UIModalTransitionStyle?,
                               completion: (() -> Void)? = nil) {
        presentModallyAt(rootController,
                         module: module,
                         animated: animated,
                         presentationStyle: presentationStyle,
                         transitionStyle: transitionStyle,
                         completion: completion)
    }

    public func isCanBePresentedModallyAtTop() -> Bool {
        return findVisibleViewController(rootController) != nil
    }

    public func presentModallyAtTop(_ module: Presentable, animated: Bool,
                                    presentationStyle: UIModalPresentationStyle,
                                    transitionStyle: UIModalTransitionStyle?) {
        guard let visibleViewController = findVisibleViewController(rootController) else {
            assertionFailure("Visible view controller not found")
            return
        }

        presentModallyAt(visibleViewController,
                         module: module,
                         animated: animated,
                         presentationStyle: presentationStyle,
                         transitionStyle: transitionStyle)
    }
    
    public func presentAtTop(_ module: Presentable, presentationStyle: UIModalPresentationStyle?, animated: Bool) {
        guard let visibleViewController = findVisibleViewController(rootController) else {
            assertionFailure("Visible view controller not found")
            return
        }

        presentAt(visibleViewController, module: module, presentationStyle: presentationStyle, animated: animated)
    }

    public func dismissModule(animated: Bool) {
        dismissModule(animated: animated, completion: nil)
    }

    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        if isPresenting {
            rootController.dismiss(animated: animated, completion: completion)
        } else if let completion = completion {
            assertionFailure("Trying to dismiss not presented viewController")
            completion()
        }
    }

    public func dismissModuleAtTop(animated: Bool) {
        dismissModuleAtTop(animated: animated, completion: nil)
    }

    public func dismissModuleAtTop(animated: Bool, completion: (() -> Void)?) {
        guard let visibleViewController = findVisibleViewController(rootController),
              let rootOfVisible = visibleViewController.presentingViewController else {
                assertionFailure("Trying to dismiss not presented viewController")
                if let completion = completion {
                    completion()
                }

                return
        }

        rootOfVisible.dismiss(animated: animated, completion: completion)
    }

    public func push(_ module: Presentable, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }

    public func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toPresent()

        rootController.pushViewController(controller, animated: animated, completion: completion)
    }

    public func popModule(animated: Bool) {
        popModule(animated: animated, completion: nil)
    }

    public func popModule(animated: Bool, completion: (() -> Void)?) {
        rootController.popViewController(animated: animated, completion: completion)
    }

    public func setRootModule(_ module: Presentable, hideBar: Bool) {
        let controller = module.toPresent()

        rootController.setViewControllers([controller], animated: false)
        rootController.isNavigationBarHidden = hideBar
    }
    
    public func popToRootModule(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }

    public func unwind(count: Int, offset: Int, animated: Bool) {
        var controllers = rootController.viewControllers
        let fromIndex = controllers.count - count - offset
        let toIndex = controllers.count - offset
        controllers.removeSubrange(fromIndex ..< toIndex)

        rootController.setViewControllers(controllers, animated: animated)
    }

    public func unwind(to module: Presentable, animated: Bool) {
        rootController.popToViewController(module.toPresent(), animated: animated)
    }

    public func clearNavigationStack() {
        
        rootController.setViewControllers([], animated: false)
    }

    public func currentPresentable() -> Presentable? {
        return findVisibleViewController(rootController)
    }
}

extension Navigator: InteractivePopDelegate {
    public func willFinishInteractivePop() {
        delegate?.willFinishSwipeModule()
    }
}
