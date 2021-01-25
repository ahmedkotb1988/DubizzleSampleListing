//
//  ListingViewModelTest.swift
//  ListingIOSTests
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import XCTest
@testable import ListingIOS

class ListingViewModelTest: BaseListingViewModelTest {

    override func setUp() {
        super.setUp()
    }
    
    func testItemsListingLoadSuccessResponse () {
        self.service = ListingServiceMock(mode: .success)
        self.buildViewModel()
        self.viewModel.onItemsLoadSuccess = {
            self.itemsLoadExpectaion.fulfill()
        }
        self.viewModel.getItemsList { (result) in
            
        }
        wait(for: [self.loadStartExpectation, self.loadFinishExpectation,self.itemsLoadExpectaion], timeout: 60,enforceOrder: true)
    }
    
    func testItemsListingLoadErrorResponse() {
        self.service = ListingServiceMock(mode: .error)
        self.buildViewModel()
        self.viewModel.getItemsList { (result) in
            
        }
        self.viewModel.onItemsLoadFail = {
            self.itemsFailedLoadExpectation.fulfill()
        }
        wait(for: [self.loadStartExpectation, self.loadFinishExpectation, self.itemsFailedLoadExpectation], timeout: 200,enforceOrder: true)
    }

}
