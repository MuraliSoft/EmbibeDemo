//
//  BaseViewController.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Combine
import Foundation
import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T?
    var bag = Set<AnyCancellable>()
    
    func showLoader(show:Bool) {
        DispatchQueue.main.async {
            show ? Spinner.start(from: self.view) : Spinner.stop()
        }
    }
}
