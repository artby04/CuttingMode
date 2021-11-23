//
//  MainModuleViewController.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import SnapKit
import UIKit
import UIModule

final class MainModuleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var collectionView: UICollectionView?


    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.width/2)-3,
                                 height: (view.frame.width/2)-3)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        guard let collectionView = collectionView else { return }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Pallete.Backgroud.primary
//        collectionView.snp.makeConstraints { make in
//     
//            make.center.equalTo(self.view)
//        }
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }


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
        setupCollectionView()
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath)

        return cell
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
