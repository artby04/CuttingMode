//
//  MainModuleInteractor.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation
import UIModule

final class MainModuleInteractor {
    weak var output: MainModuleInteractorOutput?

    init() {}
}

// MARK: - MainModuleInteractorInput

extension MainModuleInteractor: MainModuleInteractorInput {
    func getCollectionItems() -> [ModeTypeView.Model] {
        CuttingMode.allCases.map {
            ModeTypeView.Model(image: $0.image, title: $0.title)
        }
    }
}
