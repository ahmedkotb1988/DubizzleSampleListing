//
//  ItemsListModel.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public struct ItemsListModel: Codable {
    
    public var data: [ItemsListModel]?
    
    public var price: String?
    public var name: String?
    public var uid: String?
    public var image_ids: [String]?
    public var image_urls: [String]?
    public var image_urls_thumbnails: [String]?
    public var created_at: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.price = container[.price]
        self.name = container[.name]
        self.uid = container[.uid]
        self.image_ids = container[.image_ids]
        self.image_urls = container[.image_urls]
        self.image_urls_thumbnails = container[.image_urls_thumbnails]
        self.created_at = container[.created_at]
    }
}
