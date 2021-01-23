//
//  RequestPerformable.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public typealias RequestCompletion<T: Codable> = (RequestResult<T>) -> Void

public protocol BaseRequestPerformable {
    var networkClient : NetworkClient { get }
    
    func handleApiResult<T: Codable> (result: NetworkResult<Any, NetworkError>, completion: @escaping RequestCompletion<T>)
    func handleError<T: Codable> (error: NetworkError, completion: @escaping RequestCompletion<T>)
}

extension BaseRequestPerformable {
    
    public func handleApiResult<T: Codable>(result: NetworkResult<Any, NetworkError>, completion: @escaping RequestCompletion<T> ) {
            switch result {
            case .success(let apiData):
                if let filedownloadResult = apiData as? FileDownloadResult, let fileData = filedownloadResult.data {
                    let imageDataResult = ImageDownloadResult(data: fileData, fileUrl: filedownloadResult.remoteUrl)
                    completion(RequestResult<T>(apiData: imageDataResult as? T))
                } else {
                    completion(RequestResult<T>(apiData: apiData as? T))
                }
            case .failure(let error):
                self.handleError(error: error, completion: completion)
            }
        }
    
    public func handleError<T: Codable>(error: NetworkError, completion: @escaping RequestCompletion<T> ) {
           switch error {
           case .responseUnsuccessful(let responseCode):
               completion( RequestResult(error: (code: responseCode, error: error )))
           default:
               completion(RequestResult(error: error ))
           }
       }
}
public protocol RawRequestPerformable: class, BaseRequestPerformable {
    func runRawRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                   decodingType: T.Type,
                                   completion: @escaping RequestCompletion<T> )
}

public protocol UploadRequestPerformable: class, BaseRequestPerformable {
    func runUploadFileRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                          decodingType: T.Type,
                                          fileFieldName: String,
                                          completion: @escaping RequestCompletion<T> )
}

public protocol DownloadRequestPerformable: class, BaseRequestPerformable {
    func runDownloadRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                        decodingType: T.Type,
                                        completion: @escaping RequestCompletion<T> )
}

extension RawRequestPerformable {
    
    public func runRawRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                          decodingType: T.Type,
                                          completion: @escaping RequestCompletion<T> ) {
        let task = networkClient.fetch(serviceEndPoint: endPoint, decodingType: T.self) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                self?.handleApiResult(result: result, completion: completion)
            }
        }
        task?.resume()
    }
}

extension UploadRequestPerformable {
    
    public func runUploadFileRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                                 decodingType: T.Type,
                                                 fileFieldName: String,
                                                 completion: @escaping RequestCompletion<T> ) {
        let task = networkClient.upload(serviceEndPoint: endPoint,
                                        fileFieldName: fileFieldName,
                                        decodingType: T.self) { [weak self] result in
                                            DispatchQueue.main.async {
                                                self?.handleApiResult(result: result, completion: completion)
                                            }
        }
        task?.resume()
    }
}

extension DownloadRequestPerformable {
    
    public func runDownloadRequest<T: Codable>(from endPoint: NetworkEndPoint,
                                               decodingType: T.Type,
                                               completion: @escaping RequestCompletion<T> ) {
        let task = networkClient.download(serviceEndPoint: endPoint, decodingType: T.self) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                self?.handleApiResult(result: result, completion: completion)
            }
        }
        task?.resume()
    }
}
