//
//  MainModuleViewOutput.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation

protocol MainModuleViewOutput: AnyObject {
    func viewDidLoad()
    func didSelectedMode(with mode: CuttingMode)
}

