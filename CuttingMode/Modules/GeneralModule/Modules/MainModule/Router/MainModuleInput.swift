//
//  MainModuleInput.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation

protocol MainModuleInput: AnyObject {
    func configure(onLoad: (() -> Void)?)
}
