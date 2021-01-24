//
//  URLSessionProtocol.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public protocol URLSessionProtocol {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    typealias DownloadTaskResult = (URL?, URLResponse?, Error?) -> Void
    
    func dataRequest(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> NetworkOperation
    
    func uploadTask(with request: URLRequest,
                    from bodyData: Data?,
                    completionHandler: @escaping DataTaskResult) -> NetworkOperation
    
    func downloadTask(with request: URLRequest, completionHandler: @escaping DownloadTaskResult) -> NetworkOperation
}
