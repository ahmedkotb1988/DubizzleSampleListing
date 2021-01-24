//
//  ResultModel.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public struct ResultModel: Codable {
    let results: [ItemsListModel]?
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = container[.results]
    }
}

