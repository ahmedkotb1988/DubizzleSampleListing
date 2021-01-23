//
//  NetworkClient.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public typealias Completion = (NetworkResult<Any, NetworkError>) -> Void
public typealias NetworkParameter = [ParameterType: [Parameter]]
//MARK: Enums
public enum NetworkResult<T: Any, U> where U: Error {
    case success(T)
    case failure(U)
}

public enum NetworkError: Error {
    case requestFailed
    case invalidUrl
    case invalidData
    case responseUnsuccessful(responseCode: Int?)
    case jsonParsingFailure
}

public enum NetworkMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum ParameterType {
    case urlPath
    case queryString
    case post
    case binary
    case json
    case formUrlEncoded
}

//MARK: Structs

public struct Parameter {
    let key: String
    let value: Any
    
    public init(_ key: String, _ value: Any){
        self.key = key
        self.value = value
    }
}

//Mark: Protocols

public protocol NetworkEndPoint {
    var base: String { get }
    var path: String { get }
    var method: NetworkMethod { get }
    var parameters: NetworkParameter? { get set }
    var headers: [String : String]? { get }
}

public protocol NetworkOperation {
    func cancel()
    func resume()
}

public protocol NetworkRequestClient {
    func fetch<T: Decodable>(serviceEndPoint: NetworkEndPoint,
                             decodingType: T.Type,
                             completion: @escaping Completion) -> NetworkOperation?
}

public protocol NetworkClient: NetworkRequestClient {}
