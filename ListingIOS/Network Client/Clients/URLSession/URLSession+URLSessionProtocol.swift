//
//  URLSession+URLSessionProtocol.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {
    public func dataRequest(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> NetworkOperation {
        
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
    
    public func uploadTask(with request: URLRequest,
                           from bodyData: Data?,
                           completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> NetworkOperation {
        return uploadTask(with: request, from: bodyData, completionHandler: completionHandler) as URLSessionUploadTask
    }
    
    public func downloadTask(with request: URLRequest,
                             completionHandler: @escaping URLSessionProtocol.DownloadTaskResult) -> NetworkOperation {
        return downloadTask(with: request, completionHandler: completionHandler) as URLSessionTask
    }
}
