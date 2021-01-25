//
//  ListingRouter.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
import UIKit

extension BaseRouterHandler: ListingNavigatable, ListingScreenBuildable {
    
    public func navigateToListingDetails(source: UIViewController, itemModel: ItemsListModel) {
        if let viewController = self.buildDetailsScreen(itemModel: itemModel){
            self.navigate(from: source, to: viewController, animated: true)
        }
    }
}
