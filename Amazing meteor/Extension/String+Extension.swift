//
//  String+Extension.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

extension String {
    
    static var Meteors = "Meteors"
    static var Favorites = "Favorites"
    static var StorageName = "MeteorData"
    
    func StrToDate(format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}
