//
//  ModeTypeView.swift
//  UIModule
//
//  Created by Artyom on 20.11.21.
//

import SnapKit
import UIKit

public class ModeTypeView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Pallete.Content.primary
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = Pallete.Content.primary
        label.textAlignment = .center
        return label
    }()

    convenience init(with model: Model) {
        self.init()
        configure(with: model)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with model: Model) {
        imageView.image = model.image
        label.text = model.title.uppercased()
    }

    private func setupUI() {
        addSubview(imageView)
        addSubview(label)

        imageView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
           
        }

        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
    }
}

public extension ModeTypeView {
    struct Model {
        public let image: UIImage?
        public let title: String

        public init(image: UIImage?, title: String) {
            self.image = image
            self.title = title
        }
    }
}
