//
//  CustomNavigationController.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public final class CustomNavigationController: UINavigationController {
    public weak var interactivePopDelegate: InteractivePopDelegate?



    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        delegate = self
    }

    public func clearNavigationStack() {
        setViewControllers([], animated: false)
    }

    // Nav stack with custom completion block
    public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    public func popViewController(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    private func setupNavigationBar() {
       
        navigationBar.backgroundColor = .white

    }
}

extension CustomNavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges { [weak self] context in
                if !context.isCancelled {
                    self?.interactivePopDelegate?.willFinishInteractivePop()
                }
            }
        }
    }
}
