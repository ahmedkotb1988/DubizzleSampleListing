//
//  URLSessionNetworkClient.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

protocol URLSessionNetworkClient: class, NetworkClient {
    var session: URLSessionProtocol { get }
}

extension URLSessionNetworkClient {
    
    func handleHttpResponse<T: Decodable>(result: Any?,
                                          response: URLResponse?,
                                          error: Error?,
                                          type: T.Type,
                                          completion: @escaping Completion) {
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(NetworkResult.failure(.requestFailed))
            return
        }
        if NetworkConstant.httpCodeSuccess ~= httpResponse.statusCode {
            if let result = result {
                if let data = result as? Data {
                    do {
                        let genericModel = try JSONDecoder().decode(type, from: data)
                        completion(NetworkResult.success(genericModel))
                    } catch {
                        completion(NetworkResult.failure(.jsonParsingFailure))
                    }
                }
            } else {
                completion(NetworkResult.failure(.invalidData))
            }
        } else {
            completion(NetworkResult.failure(.responseUnsuccessful(responseCode: httpResponse.statusCode)))
        }
    }
    
    func jsonResponse(result: Any?) -> [String: Any]? {
            guard
                let result = result as? Data,
                let jsonResponse = try? JSONSerialization.jsonObject(with: result, options: []) as? [String: Any]
                else {
                    return nil
            }

            return jsonResponse
        }
        
        func buildURLRequest(from endpoint: NetworkEndPoint, dataFieldName: String? = nil ) -> URLRequest? {
            
            guard var urlRequest = buildUrlRequestComponents(endPoint: endpoint) else {
                return nil
            }
            
            if let postData = buildPostBody(parameters: endpoint.parameters) {
                urlRequest.addBodyData(data: postData)
                urlRequest.addValue(NetworkConstant.Header.applicationJson, forHTTPHeaderField: NetworkConstant.Header.contentType)
            }
           
            if let multiPartData = buildMultipartBody(params: endpoint.parameters,
                                                      dataFieldName: dataFieldName ?? NetworkConstant.emptyString),
                let bodyData = multiPartData.bodyData {
                
                urlRequest.addBodyData(data: bodyData)
                urlRequest.setValue(String(format: NetworkConstant.MultiPart.multipartFormData,
                                            multiPartData.boundary),
                                     forHTTPHeaderField: NetworkConstant.Header.contentType)
            }
            
            if let formUrlEncodedData = buildFormUrlEncodedBody(parameters: endpoint.parameters) {
                urlRequest.addBodyData(data: formUrlEncodedData)
                urlRequest.addValue(NetworkConstant.Header.formUrlEncoded, forHTTPHeaderField: NetworkConstant.Header.contentType)
            }
            
            return urlRequest
        }
        
        private func buildUrlRequestComponents(endPoint: NetworkEndPoint) -> URLRequest? {
            var urlRequest: URLRequest?
            
            guard var components = URLComponents(string: endPoint.base) else {
                return nil
            }
            
            components.path += buildUrlPath(endpoint: endPoint)
            components.queryItems = buildQueryParameters(parameters: endPoint.parameters)
            
            if let url = components.url {
                urlRequest = URLRequest(url: url)
                urlRequest?.httpMethod = endPoint.method.rawValue
                
                endPoint.headers?.forEach { headerItem in
                    urlRequest?.addValue(headerItem.value, forHTTPHeaderField: headerItem.key)
                }
            }
            return urlRequest
        }
        
        private func buildUrlPath(endpoint: NetworkEndPoint) -> String {
            
            guard let queryParams = endpoint.parameters?[.urlPath], !queryParams.isEmpty else {
                return endpoint.path
            }
            
            return queryParams.reduce(endpoint.path) { $0 + NetworkConstant.urlPathSeperator + String(describing: $1.value) }
        }
        
        private func buildQueryParameters(parameters: NetworkParameter? ) -> [URLQueryItem]? {
            
            guard let params = parameters, !params.isEmpty,
                let queryParams = params[.queryString], !queryParams.isEmpty  else {
                    
                return nil
            }
            
            return queryParams.map({ URLQueryItem(name: $0.key, value: String(describing: $0.value)) })
        }
        
        private func buildPostBody(parameters: NetworkParameter?) -> Data? {
            
            guard let params = parameters, !params.isEmpty else {
                    return nil
            }
            
            var bodyData = Data()
            
            if  let postParams = params[.post], !postParams.isEmpty {
                let postDic = postParams.reduce(into: [:]) {$0[$1.key] = $1.value }
                if !postDic.isEmpty, let data = try? JSONSerialization.data(withJSONObject: postDic, options: []) {
                    bodyData.append(data)
                }
            }
            
            if let jsonParams = params[.json], !jsonParams.isEmpty {
                jsonParams.forEach { param in
                    if let paramValue = param.value as? Codable, let data = paramValue.encode() {
                        bodyData.append(data)
                    }
                }
            }
            
            return bodyData.count > 0 ? bodyData : nil
        }
        
        private func buildFormUrlEncodedBody(parameters: NetworkParameter?) -> Data? {
            
            guard let params = parameters, !params.isEmpty else {
                    return nil
            }
            
            var bodyData = Data()
            
            if let urlEncodedParams = params[.formUrlEncoded], !urlEncodedParams.isEmpty {
                var argumentsArray = [String]()
                urlEncodedParams.forEach { param in
                    let paramString = "\(param.key)=\(self.percentEscapeString(param.value as? String  ?? ""))"
                    argumentsArray.append(paramString)
                }
                bodyData.append(argumentsArray.joined(separator: "&").data(using: String.Encoding.utf8)!)
            }
            
            return bodyData.count > 0 ? bodyData : nil
        }
        
        private func percentEscapeString(_ string: String) -> String {
          var characterSet = CharacterSet.alphanumerics
          characterSet.insert(charactersIn: "-._* ")
          
          return string
            .addingPercentEncoding(withAllowedCharacters: characterSet)!
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
        }
}


