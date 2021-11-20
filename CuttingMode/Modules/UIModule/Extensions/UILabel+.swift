//
//  UILabel+.swift
//  WAUIModule
//
//  Created by Daniil Yarmolyuk on 4.07.21.
//

import Foundation

extension UILabel {
    func setText(_ text: String,
                 lineHeight: CGFloat,
                 alignment: NSTextAlignment? = nil,
                 lineBreakMode: NSLineBreakMode? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        if let alignment = alignment {
            paragraphStyle.alignment = alignment
        }

        if let lineBreak = lineBreakMode {
            paragraphStyle.lineBreakMode = lineBreak
        }

        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]

        attributedText = NSAttributedString(string: text,
                                            attributes: attributes)
    }
}
