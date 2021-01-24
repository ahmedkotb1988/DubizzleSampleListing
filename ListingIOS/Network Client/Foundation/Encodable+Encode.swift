//
//  Encodable+Encode.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension Encodable {
    public func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
