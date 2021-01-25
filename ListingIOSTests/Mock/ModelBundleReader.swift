//
//  ModelBundleReader.swift
//  ListingIOSTests
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
public protocol ModelBundleReader {
    func getModel<T: Codable>(fileName: String, fileType: String, bundleClass: AnyClass) -> T?
    func getData(fileName: String, fileType: String, bundleClass: AnyClass) -> Data?
    func getFilePathForFile(fileName: String, fileType: String, bundleClass: AnyClass) -> String?
    func getLocalizationPathForFile(fileName: String, fileType: String, bundleClass: AnyClass, inDirectory: String) -> String?
}

public extension ModelBundleReader {
    func getModel<T: Codable>(fileName: String, fileType: String, bundleClass: AnyClass) -> T? {
        if let json = self.getData(fileName: fileName, fileType: fileType, bundleClass: bundleClass) {
            return try? JSONDecoder().decode(T.self, from: json)
        }
        return nil
    }
    
    func getData(fileName: String, fileType: String, bundleClass: AnyClass) -> Data? {
        if let filePath =  self.getFilePathForFile(fileName: fileName, fileType: fileType, bundleClass: bundleClass) {
            return try? Data(contentsOf: URL(fileURLWithPath: filePath))
        }
        return nil
    }
    
    func getFilePathForFile(fileName: String, fileType: String, bundleClass: AnyClass) -> String? {
        let bundle = Bundle(for: bundleClass )
        return bundle.path(forResource: fileName, ofType: fileType)
    }
    
    func getLocalizationPathForFile(fileName: String, fileType: String, bundleClass: AnyClass, inDirectory: String) -> String? {
        return Bundle(for: bundleClass ).path(forResource: fileName, ofType: fileType, inDirectory: inDirectory)
    }
}

public enum ModelReaderBundleError: String, Error {
    case errorLocatingFile = "There is an error locating the file"
    case errorGettingFileContents = "There is an error getting the file contents"
    case errorDecodingModel = "There is an error decoding json to the model"
}
