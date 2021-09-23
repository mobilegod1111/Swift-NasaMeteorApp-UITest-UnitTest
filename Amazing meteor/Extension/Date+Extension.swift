//
//  Date+Extension.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

extension Date {
    func DateToStr(format: String) -> String {
        let inputFormatter = DateFormatter()
        //inputFormatter.dateFormat = "MMM dd, yyyy"
        inputFormatter.dateFormat = format
        return inputFormatter.string(from: self)
    }
    
    func GetYear() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: self)
        guard let year = Int(yearString) else { return 0 }
        return year
    }
}
