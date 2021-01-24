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
    public func upload<T>(serviceEndPoint: NetworkEndPoint, fileFieldName: String, decodingType: T.Type,
                              completion: @escaping Completion) -> NetworkOperation? where T: Decodable {
            
            guard let url = buildURLRequest(from: serviceEndPoint, dataFieldName: fileFieldName) else {
                completion(NetworkResult.failure(.invalidUrl))
                return nil
            }
            
            let task = session.uploadTask(with: url, from: url.httpBody) { [weak self] data, response, error in
                self?.handleHttpResponse(result: data, response: response, error: error, type: decodingType,
                                         completion: completion)
            }
            
            return task
        }
        
        public func download<T: Decodable>(serviceEndPoint: NetworkEndPoint, decodingType: T.Type,
                                           completion: @escaping Completion) -> NetworkOperation? {
            
            guard let url = buildURLRequest(from: serviceEndPoint ) else {
                completion(NetworkResult.failure(.invalidUrl))
                return nil
            }
            
            let task = session.downloadTask(with: url) { [weak self] data, response, error in
                self?.handleHttpResponse(result: data, response: response, error: error,
                                         type: decodingType, completion: completion)
            }
            
            return task
        }
}
