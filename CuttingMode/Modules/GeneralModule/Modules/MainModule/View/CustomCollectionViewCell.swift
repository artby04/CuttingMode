//
//  CustomCollectionViewCell.swift
//  GeneralModule
//
//  Created by Artyom on 22.11.21.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCollectionViewCell"

    private let myImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "145659")
        return imageView
    }()

    private let myLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "Фрезирование"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        myLabel.frame = CGRect(x: 40,
                               y: contentView.frame.size.height - 50,
                               width: contentView.frame.size.width-10,
                               height: 50)


        myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                               height: contentView.frame.height-50)


    }

    
}
