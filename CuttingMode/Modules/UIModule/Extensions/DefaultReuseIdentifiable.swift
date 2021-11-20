//
//  DefaultReuseIdentifiable.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public protocol DefaultReuseIdentifiable: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public extension DefaultReuseIdentifiable where Self: UIView {
    static var defaultReuseIdentifier: String {
        let identifier = String(describing: type(of: self))
        return identifier
    }
}
