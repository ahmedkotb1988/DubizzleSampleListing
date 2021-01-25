//
//  BaseRouterHandler.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
import UIKit

public class ListingRouter: NSObject {
    
    public var handler: BaseRouterHandler?
    
    public override init() {
        let handler = BaseRouterHandler()
        ListingNavigation.handler = handler as? ListingNavigatable
        self.handler = handler
    }
}
public class BaseRouterHandler: NSObject, BaseNavigatable {}
