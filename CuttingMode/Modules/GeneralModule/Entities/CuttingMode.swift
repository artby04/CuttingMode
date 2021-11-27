//
//  CuttingMode.swift
//  GeneralModule
//
//  Created by Artyom on 27.11.21.
//

import Foundation


enum CuttingMode: Int, CaseIterable {
    case milling
    case turning
    case drilling
    case coolantConsentration
    case isoTolerances

    var image: UIImage? {
        switch self {
        case .milling:
            return UIImage(named: "mode1")
        case .turning:
            return UIImage(named: "mode5")
        case .drilling:
            return UIImage(named: "mode3")
        case .coolantConsentration:
            return UIImage(named: "mode1")
        case .isoTolerances:
            return UIImage(named: "mode5")
        }
    }
    var title: String {
        switch self {
        case .milling:
            return "фрезерование"
        case .turning:
            return "точение"
        case .drilling:
            return "сверление"
        case .coolantConsentration:
            return "концентрация"
        case .isoTolerances:
            return "допуски ISO"
        }
    }



}
