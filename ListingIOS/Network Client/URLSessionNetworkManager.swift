//
//  URLSessionNetworkManager.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

class URLSessionNetworkManager: URLSessionNetworkClient {
    var session: URLSessionProtocol
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
}
