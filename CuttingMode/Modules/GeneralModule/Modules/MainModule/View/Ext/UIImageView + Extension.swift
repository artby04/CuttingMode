//
//  UIImageView + Extension.swift
//  GeneralModule
//
//  Created by Artyom on 20.11.21.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()

        self.image = image
        self.contentMode = contentMode
    }
}
