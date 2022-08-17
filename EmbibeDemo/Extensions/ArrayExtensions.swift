//
//  ArrayExtensions.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Foundation

public extension Array {
    func getSafe(at: Int) -> Element? {
        if self.count > 0, at > -1, at < self.count {
            return self[at]
        }
        return nil
    }

    mutating func removeSafe(at: Int) {
        if at >= 0, at < self.count {
            remove(at: at)
        }
    }

    func suffixSafe(from: Int) -> ArraySlice<Element> {
        return from < count ? suffix(from: from) : []
    }
}
