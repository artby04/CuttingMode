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

    //    private let hintTitleLabel: UILabel = {
    //        let label = UILabel()
    //        label.textColor = UIColor.systemRed
    //
    //        return label
    //    }()
    //
    //    private let hintLabel: UILabel = {
    //        let label = UILabel()
    //        label.textColor =  UIColor.systemBlue
    //
    //        return label
    //    }()
    //
    //    private let stackView: UIStackView = {
    //        let stack = UIStackView()
    //        stack.axis = .horizontal
    //        stack.distribution = .fillEqually
    //
    //        return stack
    //    }()

    var modeImage = UIImageView(image: #imageLiteral(resourceName: "145659"), highlightedImage: .none)

    private var modeTitle: UILabel = {
        let label = UILabel()
        label.textColor = Pallete.Content.primary
        label.text = "Фрезирование"
        label.font =  UIFont(name: "Helvetica Neue", size: 22)
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    var stackView = UIStackView()

    func configurateStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 40

        stackView.layer.borderWidth = 3
        if #available(iOS 13.0, *) {
            stackView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            // Fallback on earlier versions
        }

        addElemToStackView()
        setStackViewConstraints()
    }

    func addElemToStackView() {


        stackView.addArrangedSubview(modeImage)
        stackView.addArrangedSubview(modeTitle)
    }

    func setStackViewConstraints() {
        stackView.snp.makeConstraints { make in
            make.width.equalTo((view.frame.width/2) - 20)
            make.height.equalTo(view.frame.width/1.5)
            make.top.equalToSuperview().inset(150)
        }
    }





    
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

        updateView()
        output.viewDidLoad()
    }


    private func setupUI() {
        view.backgroundColor =  Pallete.Backgroud.primary
        view.addSubview(modeImage)
        view.addSubview(modeTitle)

//        modeImage.snp.makeConstraints { make in
//
////            make.left.equalToSuperview().inset(0)
//        }
//
//        modeTitle.snp.makeConstraints { make in
//
////            make.centerX.equalTo(stackView)
//
//        }
            configurateStackView()
//                view.addSubview(stackView)

          

        //        view.addSubview(hintTitleLabel)
        //        view.addSubview(hintLabel)


        //        hintTitleLabel.snp.makeConstraints { make in
        //            make.top.equalTo(navigationControlle).offset(20)
        //            make.leading.trailing.equalToSuperview().inset(20)
        //        }
        //
        //        hintLabel.snp.makeConstraints { make in
        //            make.top.equalTo(hintTitleLabel.snp.bottom).offset(4)
        //            make.leading.trailing.equalToSuperview().inset(20)
        //        }

        //        view.addSubview(mainLabel)
    }



}

// MARK: - MainModuleViewInput

extension MainModuleViewController: MainModuleViewInput {
    func updateView() {
        updateMainPhoto()
    }

    func updateMainPhoto() {
        let params = dataSource.modelsParams()

        //        hintTitleLabel.text = "hintTitleLabel"
        //        hintLabel.text = "hintLabel"
        //        stackView.backgroundColor = .red


        //        mainLabel.text = "12312323"
        //        mainLabel.textColor = .yellow
    }
}
