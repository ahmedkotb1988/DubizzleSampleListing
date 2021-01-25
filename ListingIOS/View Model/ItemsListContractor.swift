//
//  ItemsListContractor.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

protocol ItemsListContractor: BaseViewModelProtocol {
    
    var onItemsLoadSuccess: Action? { get set }
    var onItemsLoadFail: Action? { get set }
    func getItemsList() -> [ItemsListModel]?
}
