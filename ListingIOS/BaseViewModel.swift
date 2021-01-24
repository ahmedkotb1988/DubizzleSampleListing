//
//  BaseViewModel.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
open class BaseViewModel: BaseViewModelProtocol {
    open var onLoadStart: Action?
    open var onLoadFinish: ActionWithError?
    open var onError: ActionWithError?
    open var onShowMessage: ((String?, String?, Bool, MessageTarget) -> Void)?
    
    public init() {}
    
    open func getTitle() -> String? {
        return nil
    }
}

public extension BaseViewModel {
    func startLoading() {
        self.onLoadStart?()
    }
    func finishLoading(with error: ViewError? = nil) {
        self.onLoadFinish?(error)
    }
    func show(error: ViewError?) {
        self.onError?(error)
    }
    func finishLoadingWithMessage(title: String?, description: String?, isSuccess: Bool, location: MessageTarget) {
        self.onLoadFinish?(nil)
        self.onShowMessage?(title, description, isSuccess, location)
    }
}
