//
//  ImageDownloadResult.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public struct ImageDownloadResult: Codable {
    
    public let fileUrl: URL?
    public let data: Data?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        data = container[.data]
        fileUrl = container[.fileUrl]
    }
    
    public init( data: Data?, fileUrl: URL?) {
        self.data = data
        self.fileUrl = fileUrl
    }
}
