//
//  ListingNavigatable.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit

public class ListingNavigation {
    
    public static var handler: ListingNavigatable?
}

public protocol ListingNavigatable: BaseNavigatable {
    func navigateToListingDetails(source: UIViewController, itemModel: ItemsListModel)
}

extension ListingNavigatable {
    public func navigateToListingDetails(source: UIViewController, itemModel: ItemsListModel) {
        ListingRouter.init()
        ListingNavigation.handler?.navigateToListingDetails(source: source, itemModel: itemModel)
    }
}
