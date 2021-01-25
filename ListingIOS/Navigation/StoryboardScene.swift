//
//  StoryboardScene.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import Foundation
import UIKit

internal enum StoryboardScene {
    internal enum Listing: StoryboardType {
        internal static let storyboardName = "Main"
        internal static let itemDetailsViewController = SceneType<ListingIOS.ListingDetailsViewController>(storyboard: Listing.self, identifier: "ListingDetailsViewController")
    }
}

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

private final class BundleToken {}
