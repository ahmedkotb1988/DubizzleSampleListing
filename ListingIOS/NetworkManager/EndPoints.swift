//
//  EndPoints.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public enum EndPoints {
    case getItemsListing
}

extension EndPoints: NetworkEndPoint {
    public var parameters: NetworkParameter? {
        get {
            return nil
        }
        set {
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var base: String{
        return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    }
    
    public var path: String{
        
        switch self {
        case .getItemsListing:
            return "default/dynamodb-writer"
        }
    }
    
    public var method: NetworkMethod {
        switch self {
        case .getItemsListing:
            return .get
        }
    }
}
