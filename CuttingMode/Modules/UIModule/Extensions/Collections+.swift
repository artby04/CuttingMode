//
//  Collections+.swift
//  WAGeneralModule
//
//  Created by Daniil Yarmolyuk on 27.06.21.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
