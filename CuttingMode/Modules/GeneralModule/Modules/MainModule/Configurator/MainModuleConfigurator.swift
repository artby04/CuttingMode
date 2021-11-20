//
//  MainModuleConfigurator.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation
import UIModule

class MainModuleConfigurator {
    func configure(router: MainModuleOutput) -> (view: Presentable, input: MainModuleInput) {
        let interactor = MainModuleInteractor()

        let presenter = MainModulePresenter()
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        let viewController = MainModuleViewController()

        viewController.dataSource = presenter
        viewController.output = presenter

        presenter.view = viewController

        return (viewController, presenter)
    }
}
