//
//  UIColor+.swift
//  UIModule
//
//  Created by Artyom on 20.11.21.
//

import UIKit.UIColor

public enum Pallete {
    
    public enum Backgroud {
    
        public static var primary: UIColor { RawColors.Blue.blue0 }
    }
}

extension Pallete {
    
    enum RawColors {
        
        enum Blue {
            
            static let blue0 = UIColor(hex: 0x38415b)
        }
        
        
    }
}

