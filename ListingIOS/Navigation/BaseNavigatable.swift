//
//  BaseNavigatable.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit

public protocol BaseNavigatable: class {
    
    func navigate(from: UIViewController, to: UIViewController, animated: Bool)
    func present(from: UIViewController, to: UIViewController, overCurrentContext: Bool)
}

public extension BaseNavigatable {
    
    func navigate(from: UIViewController, to: UIViewController, animated: Bool) {
        from.navigationController?.pushViewController(to, animated: animated)
    }
    
    func present(from: UIViewController, to: UIViewController, overCurrentContext: Bool) {
        to.modalPresentationStyle = (overCurrentContext == true) ? .overCurrentContext : .fullScreen
        from.present(to, animated: true, completion: nil)
    }
}
