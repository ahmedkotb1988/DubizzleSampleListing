//
//  ListingScreenBuildable.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit

public protocol ListingScreenBuildable {
    func buildDetailsScreen(itemModel: ItemsListModel) -> UIViewController?
}

public extension ListingScreenBuildable {
    
    func buildDetailsScreen(itemModel: ItemsListModel) -> UIViewController? {
        let viewController = StoryboardScene.Listing.itemDetailsViewController.instantiate()
        viewController.listModel = itemModel
        return viewController
    }
}
