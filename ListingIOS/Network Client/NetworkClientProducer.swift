//
//  NetworkClientProducer.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public enum NetworkClients {
    case URLSessionHttpClient
}

public class NetworkClientProducer {
    
    public static func makeNetworkClient(networkClientType: NetworkClients) -> NetworkClient {
        switch networkClientType {
        case .URLSessionHttpClient:
            return URLSessionNetworkManager()
        }
    }
}
