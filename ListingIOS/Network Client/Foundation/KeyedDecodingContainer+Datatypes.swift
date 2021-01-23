//
//  KeyedDecodingContainer+Datatypes.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    
    subscript<T: Decodable>(key: KeyedDecodingContainer.Key) -> T? {
        return try? decodeIfPresent(T.self, forKey: key)
    }
    
    subscript(key: KeyedDecodingContainer.Key) -> URL? {
        if let urlValue = try? self.decode(URL?.self, forKey: key) {
            return urlValue
        }
        
        if let stringValue = try? self.decode(String.self, forKey: key) {
            return URL(string: stringValue)
        }
        return nil
    }
    
    subscript(key: KeyedDecodingContainer.Key) -> Bool? {
           if let boolValue = try? self.decode(Bool?.self, forKey: key) {
               return boolValue
           }
           
           if let stringValue = try? self.decode(String.self, forKey: key) {
               if let boolValue = Bool(stringValue) {
                   return boolValue
               }
               
               if let intValue = Int(stringValue), 0 ... 1 ~= intValue {
                   return Bool(truncating: intValue as NSNumber)
               }
           }
           
           if let intValue = try? self.decode(Double.self, forKey: key), 0 ... 1 ~= intValue {
               return Bool(truncating: intValue as NSNumber)
           }
           
           return nil
       }
    
    subscript(key: KeyedDecodingContainer.Key) -> Int? {
            if let intValue = try? self.decode(Int?.self, forKey: key) {
                return intValue
            }
            
            if let stringValue = try? self.decode(String.self, forKey: key) {
                return Int(stringValue)
            }
            
            return nil
        }
        
        subscript(key: KeyedDecodingContainer.Key) -> Float? {
            if let floatValue = try? self.decode(Float?.self, forKey: key) {
                return floatValue
            }
            
            if let stringValue = try? self.decode(String.self, forKey: key) {
                return Float(stringValue)
            }
            
            return nil
        }
        
        subscript(key: KeyedDecodingContainer.Key) -> Double? {
            if let doubleValue = try? self.decode(Double?.self, forKey: key) {
                return doubleValue
            }
            
            if let stringValue = try? self.decode(String.self, forKey: key) {
                return Double(stringValue)
            }
            
            return nil
        }
    subscript(key: KeyedDecodingContainer.Key) -> String? {
            if let stringValue = try? self.decode(String?.self, forKey: key) {
                return stringValue
            }
            if let value = try? self.decode(Int?.self, forKey: key) {
                    return "\(value)"
            }
            if let value = try? self.decode(Float?.self, forKey: key) {
                    return "\(value)"
            }
            if let value = try? self.decode(Double?.self, forKey: key) {
                    return "\(value)"
            }
            if let value = try? self.decode(Bool?.self, forKey: key) {
                    return "\(value)"
            }
            return nil
        }
}
