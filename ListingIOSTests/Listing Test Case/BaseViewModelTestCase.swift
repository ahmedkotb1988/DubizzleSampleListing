//
//  BaseViewModelTestCase.swift
//  ListingIOSTests
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import XCTest
@testable import ListingIOS

open class BaseViewModelTestCase: XCTestCase {

    open var loadStartExpectation = XCTestExpectation(description: "loadStartExpectation")
    open var loadFinishExpectation = XCTestExpectation(description: "loadFinishExpectation")
    open var showErrorExpaectation = XCTestExpectation(description: "showErrorExpaectation")
    
    open func attachExpectations(viewModel: BaseViewModel) {
        viewModel.onLoadStart = { [weak self] in
            self?.loadStartExpectation.fulfill()
        }
        
        viewModel.onLoadFinish = { [weak self] (error) in
            self?.loadFinishExpectation.fulfill()
        }
        
        viewModel.onError = { [weak self] (error) in
            self?.showErrorExpaectation.fulfill()
        }
    }

}
