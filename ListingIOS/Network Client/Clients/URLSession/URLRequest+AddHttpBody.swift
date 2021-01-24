//
//  URLRequest+AddHttpBody.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension URLRequest {
    mutating func addBodyData(data: Data) {
        if self.httpBody == nil {
            self.httpBody = Data()
        }
        self.httpBody?.append(data)
    }
}
