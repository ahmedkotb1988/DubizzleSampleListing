//
//  RequestResult.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public struct RequestResult<T: Codable> {
    
    public var error: (code: Int?, error: Error?)?
    public var apiData: T?
    
    public init( error: (code: Int?, error: Error?)?, apiData: T?) {
        self.error = error
        self.apiData = apiData
    }
    
    public init(apiData: T? ) {
        self.init(error: nil, apiData: apiData)
    }
    
    public init(rawData: Data? ) {
        self.init(error: nil, apiData: nil)
    }
    
    public init(error:  (code: Int?, error: Error?) ) {
        self.init(error: error, apiData: nil)
    }
    
    public init(error: Error?) {
        self.init(error: (code: nil, error:error), apiData: nil)
    }
}
