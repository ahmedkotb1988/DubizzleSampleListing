//
//  BaseViewModelProtocol.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
public typealias Action = (() -> Void)
public typealias ActionWith<T> = ((T) -> Void)
public typealias ActionWithTwoParameter<T, Y> = ((T, Y) -> Void)
public typealias ActionWithError = ((ViewError?) -> Void)
public typealias ActionWithResult<T> = ((ModelResult<T>) -> Void)

public enum ModelResult<T> {
    case success(T)
    case failure(ViewError)
}
public enum MessageTarget {
    case high
    case middle
    case low
}

/// MessageViewSize of the component - to adjust view size.
public enum MessageViewSize: Equatable {
    case large
    case small
    case custom(height: Int, iconWidth: Int)
}

public protocol BaseViewModelProtocol: class {
    var onLoadStart: Action? {get set}
    var onLoadFinish: ActionWithError? {get set}
    var onError: ActionWithError? {get set}
    var onShowMessage: ((String?, String?, Bool, MessageTarget) -> Void)? {get set}
}
