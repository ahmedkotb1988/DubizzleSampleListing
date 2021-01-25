//
//  ListingServiceMock.swift
//  ListingIOSTests
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

@testable import ListingIOS

enum ListServiceMockMode {
    case success
    case error
}

class ListingServiceMock: ItemsApiContractor, ModelBundleReader {
    
    var mode: ListServiceMockMode
    var networkClient: NetworkClient
    
    init(mode: ListServiceMockMode = .success,
         networkClient: NetworkClient = NetworkClientProducer.makeNetworkClient(networkClientType: NetworkClients.URLSessionHttpClient )) {
        self.mode = mode
        self.networkClient = networkClient
    }
    
    func getItemsList(completion: @escaping RequestCompletion<ResultModel>) {
        switch self.mode {
        case .success:
            let result : ResultModel? = self.getModel(fileName: "ItemResultResponse", fileType: "json", bundleClass: ListingServiceMock.self)
            completion(RequestResult(error: nil, apiData: result))
        case .error:
            let apiError = ViewError(with: "")
            completion(RequestResult(error: (code: 0, error: apiError), apiData: nil))
        }
    }
}
