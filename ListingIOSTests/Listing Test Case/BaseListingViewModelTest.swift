//
//  BaseListingViewModelTest.swift
//  ListingIOSTests
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import XCTest
@testable import ListingIOS

class BaseListingViewModelTest: BaseViewModelTestCase {

    var service : ItemsApiContractor = ListingServiceMock(mode: .success)
    var viewModel = ItemsListViewModel()
    
    var itemsLoadExpectaion = XCTestExpectation(description: "itemsLoadExpectaion")
    var itemsFailedLoadExpectation = XCTestExpectation(description: "itemsFailedLoadExpectaion")
    
    func buildViewModel() {
        let viewModel = ItemsListViewModel(service: self.service)
        self.viewModel = viewModel
        self.attachExpectations(viewModel: viewModel)
        self.viewModel.onItemsLoadSuccess = {
            self.itemsLoadExpectaion.fulfill()
        }
        self.viewModel.onItemsLoadFail = {
            self.itemsFailedLoadExpectation.fulfill()
        }
    }

}
