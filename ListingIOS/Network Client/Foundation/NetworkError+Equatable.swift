//
//  NetworkError+Equatable.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension NetworkError: Equatable {
    
    public static func == ( lhs: NetworkError, rhs: NetworkError ) -> Bool {
        switch (lhs, rhs) {
        case ( .requestFailed, requestFailed ):
            return true
        case ( .invalidUrl, .invalidUrl ):
            return true
        case ( .invalidData, .invalidData ):
            return true
        case ( .responseUnsuccessful, .responseUnsuccessful):
            return true
        case  ( .jsonParsingFailure, .jsonParsingFailure ):
            return true
        default:
            return false
        }
    }
}
