//
//  MainModulePresenter.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation

final class MainModulePresenter {
    weak var view: MainModuleViewInput?
    var router: MainModuleOutput!
    var interactor: MainModuleInteractorInput!

    private var state = MainModulePresenterState()
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput {
    func configure(onLoad: (() -> Void)?) {
        state.onLoad = onLoad
    }
}

// MARK: - MainModuleViewOutput

extension MainModulePresenter: MainModuleViewOutput {
    func viewDidLoad() {}
}

// MARK: - MainModuleInteractorOutput

extension MainModulePresenter: MainModuleInteractorOutput {}

// MARK: - MainModuleViewDataSource

extension MainModulePresenter: MainModuleViewDataSource {
    func modelsParams() -> MainModuleModelsParams {
        return MainModuleModelsParams(mainPhoto: nil)
    }
}
