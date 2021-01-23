//
//  URLSessionNetworkClient+MultiPartRequest.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

extension URLSessionNetworkClient {
    
    func buildMultipartBody(params: NetworkParameter?, dataFieldName: String) -> (bodyData: Data?, boundary: String)? {
        
        guard let parameters = params, !parameters.isEmpty, let binaryParameters = parameters[.binary], !binaryParameters.isEmpty else {
            return nil
        }
        
        var requestBody = Data()
        let boundary = getBoundary()
        let boundaryPrefix = getBoundaryPrefix(boundary: boundary)
        
        for parameter in binaryParameters {
            if parameter.value is String {
                requestBody.append(boundaryPrefix)
                requestBody.append(getContentDisposition(parameterName: parameter.key))
                requestBody.append("\(parameter.value)")
                requestBody.append(NetworkConstant.newLine)
                
            } else {
                if let data = parameter.value as? Data {
                    requestBody.append(boundaryPrefix)
                    requestBody.append(getContentDisposition(fileName: parameter.key, fileFieldName: dataFieldName))
                    requestBody.append(getContentType(fileData: data))
                    requestBody.append(NetworkConstant.newLine)
                    requestBody.append(NetworkConstant.newLine)
                    requestBody.append(data)
                    requestBody.append(NetworkConstant.newLine)
                }
            }
        }
        requestBody.append(String(format: NetworkConstant.MultiPart.boundarySuffix, boundary))
        return (requestBody, boundary)
    }
    
    func getBoundary() -> String {
        return String(format: NetworkConstant.MultiPart.boundary, UUID().uuidString)
    }
    
    private func getContentDisposition(parameterName: String) -> String {
        return String(format: NetworkConstant.MultiPart.contentDispositionParameter, parameterName)
    }
    
    private func getContentType(fileData: Data) -> String {
        return String(format: NetworkConstant.MultiPart.contentTypeMime, fileData.mimeType)
    }
    
    private func getContentDisposition(fileName: String, fileFieldName: String) -> String {
        return String(format: NetworkConstant.MultiPart.contentDispositionFile, fileFieldName, fileName)
    }
    
    private func getBoundaryPrefix(boundary: String) -> String {
        return String(format: NetworkConstant.MultiPart.boundaryPrefix, boundary)
    }
}


