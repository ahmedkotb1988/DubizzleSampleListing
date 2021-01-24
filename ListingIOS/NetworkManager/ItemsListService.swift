//
//  ItemsListService.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation

public protocol ItemListService: RawRequestPerformable {
    func getItemsList(completion: @escaping RequestCompletion<ResultModel>)
}

extension ItemListService {
   public func getItemsList(completion: @escaping RequestCompletion<ResultModel>) {
        let endpoint = EndPoints.getItemsListing
        self.runRawRequest(from: endpoint, decodingType: ResultModel.self, completion: completion)
    }
}
