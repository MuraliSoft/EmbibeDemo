//
//  StringExtension.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//
import Foundation
import UIKit

public extension String {

    var trimed :String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self)
    }
}

