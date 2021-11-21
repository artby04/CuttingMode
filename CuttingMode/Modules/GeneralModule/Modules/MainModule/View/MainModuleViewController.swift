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
    //      let label = ModeTypeView()

    //    var title: UILabel = {
    //        let button
    //    }

    let logoImage = UIImageView(image: #imageLiteral(resourceName: "145659"), contentMode: .scaleAspectFit)
    
    
    //    private let mainLabel = UILabel(frame: .zero)

    // Dependencies
    var dataSource: MainModuleViewDataSource!
    var output: MainModuleViewOutput!

    // Local env
    private var state = MainModuleViewControllerState()

    override func loadView() {
        super.loadView()
        //        setupMainLabel()
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()

        updateView()
        output.viewDidLoad()
    }

    private func setupConstraints() {
        view.addSubview(logoImage)

        logoImage.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    //    private func setupMainLabel() {
    //        mainLabel.contentMode = .scaleAspectFill
    //    }
    //
    private func setupUI() {
        view.backgroundColor =  Pallete.Backgroud.primary

        //        view.addSubview(mainLabel)
        ////        mainLabel.
    }
}

// MARK: - MainModuleViewInput

extension MainModuleViewController: MainModuleViewInput {
    func updateView() {
        updateMainPhoto()
    }

    func updateMainPhoto() {
        let params = dataSource.modelsParams()
        //        mainLabel.text = "12312323"
        //        mainLabel.textColor = .yellow
    }
}
