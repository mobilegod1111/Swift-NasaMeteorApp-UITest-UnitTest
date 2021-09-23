//
//  UIColor+Extension.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: Double) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
       }

    convenience init(rgb: Int, alpha: Double) {
       self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
       )
    }
    
    static var ViewBkClr = UIColor(rgb: Int.nViewBkClr, alpha: 1.0)
    static var BarBgClr = UIColor(rgb: Int.nBarBgClr, alpha: 1.0)
    static var SegmentedSelClr = UIColor(rgb: Int.nSegmentedSelClr, alpha: 1.0)
    static var SegmentedBgClr = UIColor(rgb: Int.nSegmentedBgClr, alpha: 1.0)
    static var TitleClr = UIColor(rgb: Int.nTitleClr, alpha: 1.0)
}
