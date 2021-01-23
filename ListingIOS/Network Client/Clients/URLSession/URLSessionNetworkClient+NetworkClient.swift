//
//  URLSessionNetworkClient+NetworkClient.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension URLSessionNetworkClient {
    
    public func fetch<T : Decodable>(serviceEndPoint: NetworkEndPoint, decodingType: T.Type, completion: @escaping Completion) -> NetworkOperation? {
        
        guard let url = buildURLRequest(from: serviceEndPoint) else {
            completion(NetworkResult.failure(.invalidUrl))
            return nil
        }
        let task = session.dataRequest(with: url) { [weak self] data, response, error in
            self?.handleHttpResponse(result: data, response: response, error: error, type: decodingType, completion: completion)
        }
        return task
    }
}
