//
//  ViewError.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
public struct ViewError: Error {
    private var message: String
    public var localizedDescription: String {
        return self.message
    }
    public init(with message: String?) {
        self.message = message ?? ""
    }
    public init(with error: Error?) {
        self.message = error?.localizedDescription ?? ""
    }
}

public extension ViewError {
    static var empty: ViewError {
        return ViewError(with: "")
    }
}
