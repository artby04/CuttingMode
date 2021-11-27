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

    // Dependencies
    var dataSource: MainModuleViewDataSource!
    var output: MainModuleViewOutput!

    // Local env
    private var state = MainModuleViewControllerState()

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        configurateCollectionLayout()
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear

        collectionView.registerClass(ModeTypeCell.self)

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateView()
        output.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = Pallete.Backgroud.primary

        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(16)
        }
    }

    private func configurateCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(
            width: (view.frame.width / 2) - 3,
            height: view.frame.width / 1.7
        )
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1

        return layout
    }
}

// MARK: - MainModuleViewInput

extension MainModuleViewController: MainModuleViewInput {
    func updateView() {
        let params = dataSource.modelsParams()
        state.collectionItems = params.collectionItems
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension MainModuleViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return state.collectionItems.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let model = state.collectionItems[safe: indexPath.row] else { return UICollectionViewCell() }
        let cell: ModeTypeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: .init(modeTypeViewModel: model))
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MainModuleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let mode = CuttingMode(rawValue: indexPath.row) else { return }
        output.didSelectedMode(with: mode)
    }
}
