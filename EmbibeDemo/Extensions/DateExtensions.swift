//
//  DateExtensions.swift
//  EmbibeDemo
//
//  Created by Admin on 8/17/22.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    func getFormattedDate(style: DateFormatter.Style) -> String {
         let dateformat = DateFormatter()
         dateformat.dateStyle = style
         return dateformat.string(from: self)
     }
}
