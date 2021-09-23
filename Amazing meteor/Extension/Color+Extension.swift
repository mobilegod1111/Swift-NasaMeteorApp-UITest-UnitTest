//
//  Color+Extension.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

extension Color {
    init(red: Int, green: Int, blue: Int, alpha: Double) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: Double(CGFloat(red)) / 255.0, green: Double(CGFloat(green)) / 255.0, blue: Double(CGFloat(blue)) / 255.0, opacity: alpha)
       }

    init(rgb: Int, alpha: Double) {
       self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
       )
    }
    
    static var ViewBkClr = Color(rgb: Int.nViewBkClr, alpha: 1.0)
    static var CardBgClr = Color(rgb: Int.nCardBgClr, alpha: 1.0)
    static var TitleClr = Color(rgb: Int.nTitleClr, alpha: 1.0)
    static var BodyClr = Color(rgb: Int.nBodyClr, alpha: 1.0)
    static var arrow_rightClr = Color(rgb: Int.nArrow_rightClr, alpha: 1.0)
    static var BarBgClr = Color(rgb: Int.nBarBgClr, alpha: 1.0)
    static var TabSelectedClr = Color(rgb: Int.nTabSelectedClr, alpha: 1.0)
}
