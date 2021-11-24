//
//  WeatherModuleInteractorInput.swift
//  Pods
//
//  Created Daniil Yarmolyuk on 27.06.21.
//

import Foundation
import UIModule

protocol MainModuleInteractorInput: AnyObject {
    func getCollectionItems() -> [ModeTypeView.Model]
}
