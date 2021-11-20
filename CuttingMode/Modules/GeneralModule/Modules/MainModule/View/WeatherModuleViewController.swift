//
//  MainModuleViewController.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import SnapKit
import UIKit
import UIModule

final class MainModuleViewController: UIViewController {
    private let mainPhotoView = UILabel(frame: .zero)

    // Dependencies
    var dataSource: MainModuleViewDataSource!
    var output: MainModuleViewOutput!

    // Local env
    private var state = MainModuleViewControllerState()

    override func loadView() {
        super.loadView()
        setupImageView()
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        output.viewDidLoad()
    }

    private func setupImageView() {
        mainPhotoView.contentMode = .scaleAspectFill
    }
    
    private func setupUI() {
        view.backgroundColor = .black

        view.addSubview(mainPhotoView)
        mainPhotoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - MainModuleViewInput

extension MainModuleViewController: MainModuleViewInput {
    func updateView() {
        updateMainPhoto()
    }

    func updateMainPhoto() {
        let params = dataSource.modelsParams()
        mainPhotoView.text = "test"
        mainPhotoView.textColor = .white
    }
}
