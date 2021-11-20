//
//  MainModuleInteractor.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation

final class MainModuleInteractor {
    weak var output: MainModuleInteractorOutput?

    init() {}
}

// MARK: - MainModuleInteractorInput

extension MainModuleInteractor: MainModuleInteractorInput {}
