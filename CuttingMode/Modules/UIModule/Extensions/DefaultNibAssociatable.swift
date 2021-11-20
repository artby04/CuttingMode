//
//  DefaultNibAssociatable.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public protocol DefaultNibAssociatable: AnyObject {
    static var defaultNibName: String { get }
}

public extension DefaultNibAssociatable where Self: UIView {
    static var defaultNibName: String {
        guard let name = NSStringFromClass(self).components(separatedBy: ".").last else {
            fatalError("Wrong nib name")
        }

        return name
    }
}
