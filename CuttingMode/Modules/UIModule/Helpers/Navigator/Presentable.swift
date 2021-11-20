//
//  Presentable.swift
//  WeatherApp
//
//  Created by Daniil Yarmolyuk on 26.06.21.
//

import UIKit

public protocol Presentable: AnyObject {
    func toPresent() -> UIViewController
}
