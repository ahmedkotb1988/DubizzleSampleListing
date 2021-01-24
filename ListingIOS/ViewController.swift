//
//  ViewController.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ItemsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.getItemsList { (itemsList) in
            print(itemsList)
        }
        self.viewModel.onItemsLoadSuccess = {[weak self]  in
            self?.reloadInputViews()
        }
    }


}

