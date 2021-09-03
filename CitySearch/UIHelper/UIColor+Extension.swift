//
//  UIColor+Extension.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import Foundation
import UIKit

public extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

public extension UIColor {
    
    //KT button yellow
    static var mainColor: UIColor = {
        return UIColor(r: 247, g: 201, b: 1)
    }()
    
    //KT Blue
    static var ktBlue: UIColor = {
        return UIColor(r: 74, g: 136, b: 194)
    }()
    
}
