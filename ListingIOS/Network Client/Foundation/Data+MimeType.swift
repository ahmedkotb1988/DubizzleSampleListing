//
//  Data+MimeType.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension Data {
    
    private static let mimeTypeSignatures: [UInt8: String] = [
        0xFF: "image/jpeg",
        0x89: "image/png",
        0x47: "image/gif",
        0x49: "image/tiff",
        0x4D: "image/tiff",
        0x25: "application/pdf",
        0xD0: "application/vnd",
        0x46: "text/plain"
    ]
    
    public var mimeType: String {
        var copyInt: UInt8 = 0
        copyBytes(to: &copyInt, count: 1)
        return Data.mimeTypeSignatures[copyInt] ?? "application/octet-stream"
    }
    
    public mutating func append(_ string: String) {
            if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) {
                append(data)
            }
        }
}
