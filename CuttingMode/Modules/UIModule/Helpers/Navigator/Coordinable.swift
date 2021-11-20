//
//  Coordinable.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import Foundation

public protocol Coordinatable: AnyObject {
    associatedtype DeepLink

    func start(with option: DeepLink, animated: Bool, completion: (() -> Void)?)
}
