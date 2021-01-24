//
//  NetworkConstants.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

struct NetworkConstant {
    
    static let httpCodeSuccess = 200..<401
    static let httpCodeForbidden = 403
    static let emptyString = ""
    static let newLine = "\r\n"
    static let urlPathSeperator = "/"
    
    struct  Header {
        static let contentType = "Content-Type"
        static let applicationJson = "application/json"
        static let formUrlEncoded = "application/x-www-form-urlencoded"
    }
    
    struct  MultiPart {
        static let multipartFormData = "multipart/form-data; boundary=%@"
        static let boundarySuffix = "--%@--\r\n"
        static let boundary = "Boundary-%@"
        static let boundaryPrefix = "--%@\r\n"
        static let contentDispositionParameter = "Content-Disposition: form-data; name=\"%@\"\r\n\r\n"
        static let contentDispositionFile = "Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n"
        static let contentTypeMime =  "Content-Type: %@"
    }
}
