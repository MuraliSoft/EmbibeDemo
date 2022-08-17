//
//  BaseViewController.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Foundation
import Combine


class BaseViewModel {
    
    @Published
    var isLoading:Bool = false
    
    deinit {
        print("DEINIT", NSStringFromClass(Self.self))
    }
}
