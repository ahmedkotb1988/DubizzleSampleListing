//
//  ItemsListViewModel.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

class ItemsListViewModel: BaseViewModel, ItemsListContractor {
    var onItemsLoadSuccess: Action?
    var onItemsLoadFail: Action?
    var listItems: [ItemsListModel]?
    
    
    
    private (set) var service: ItemsApiContractor
    init(service: ItemsApiContractor = ItemsNetworkManager()) {
        self.service = service
    }
    
    func getItemsList() -> [ItemsListModel]? {
        return self.listItems
    }
    
    func getItemsList(completion: @escaping ([ItemsListModel])-> Void){
        self.startLoading()
        self.service.getItemsList { [weak self] (result) in
            
            guard let itemsListResult = result.apiData?.results else {
                self?.onItemsLoadFail?()
                self?.finishLoadingWithMessage(title: "Error", description: "Failed to retrieve data", isSuccess: false, location: .low)
                return
            }
            self?.finishLoading()
            self?.listItems = itemsListResult
            completion(itemsListResult)
            self?.onItemsLoadSuccess?()
        }
    }
    
    func getFormattedDate(createdDate: String) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SS"
        let dateObject = dateFormatter.date(from: createdDate)
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let formattedDate = dateFormatter.string(from: dateObject ?? Date())
        return formattedDate
    }
}

