//
//  ModeTypeView.swift
//  UIModule
//
//  Created by Artyom on 20.11.21.
//

import SnapKit
import UIKit

public class ModeTypeCell: UICollectionViewCell {
    private let modeTypeView = ModeTypeView()

    convenience init(with model: Model) {
        self.init(frame: .zero)
        configure(with: model)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with model: Model) {
        modeTypeView.configure(with: model.modeTypeViewModel)
    }

    private func setupUI() {
        addSubview(modeTypeView)

        modeTypeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

public extension ModeTypeCell {
    struct Model {
        public let modeTypeViewModel: ModeTypeView.Model

        public init(modeTypeViewModel: ModeTypeView.Model) {
            self.modeTypeViewModel = modeTypeViewModel
        }
    }
}
