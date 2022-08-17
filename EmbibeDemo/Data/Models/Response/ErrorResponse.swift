//
//  GenericResponse.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Foundation

struct ErrorResponse: Encodable, Error {

    let message: String
    
    init(message: String) {
        self.message = message
    }
    
}
