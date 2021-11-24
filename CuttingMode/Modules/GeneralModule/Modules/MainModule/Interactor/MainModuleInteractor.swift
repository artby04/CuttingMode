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
        return [
            .init(image: #imageLiteral(resourceName: "145659"), title: "ФРЕЗИРОВАНИЕ"),
            .init(image: #imageLiteral(resourceName: "145659"), title: "ТОЧЕНИЕ"),
            .init(image: #imageLiteral(resourceName: "145659"), title: "СВЕРЛЕНИЕ"),
            .init(image: #imageLiteral(resourceName: "145659"), title: "КОНЦЕНТРАЦИЯ СОЖ"),
            .init(image: #imageLiteral(resourceName: "145659"), title: "КОНЦЕНТРАЦИЯ СОЖ КОНЦЕНТРАЦИЯ"),
        ]
    }
}
