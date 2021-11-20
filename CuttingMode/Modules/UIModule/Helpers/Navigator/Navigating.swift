//
//  Navigating.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public protocol Navigating: Presentable {
    var delegate: NavigatorDelegate? { get set }

    var isPresenting: Bool { get }

    func present(_ module: Presentable, animated: Bool)
    func presentModally(_ module: Presentable,
                        animated: Bool,
                        presentationStyle: UIModalPresentationStyle,
                        transitionStyle: UIModalTransitionStyle?,
                        completion: (() -> Void)?)

    func isCanBePresentedModallyAtTop() -> Bool
    func presentModallyAtTop(_ module: Presentable,
                             animated: Bool,
                             presentationStyle: UIModalPresentationStyle,
                             transitionStyle: UIModalTransitionStyle?)
    
    func presentAtTop(_ module: Presentable, presentationStyle: UIModalPresentationStyle?, animated: Bool)
    
    func push(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    
    func popModule(animated: Bool)
    func popModule(animated: Bool, completion: (() -> Void)?)
    
    func dismissModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func dismissModuleAtTop(animated: Bool)
    func dismissModuleAtTop(animated: Bool, completion: (() -> Void)?)
    
    func popToRootModule(animated: Bool)

    func unwind(count: Int, offset: Int, animated: Bool)
    func unwind(to module: Presentable, animated: Bool)
    
    func clearNavigationStack()

    func currentPresentable() -> Presentable?
}
