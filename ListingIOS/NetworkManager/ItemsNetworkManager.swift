//
//  ItemsNetworkManager.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

public class ItemsNetworkManager: ItemsApiContractor {
    
    public var networkClient: NetworkClient
    
    public init(networkClient: NetworkClient = NetworkClientProducer.makeNetworkClient(networkClientType: NetworkClients.URLSessionHttpClient)){
        self.networkClient = networkClient
    }
}
