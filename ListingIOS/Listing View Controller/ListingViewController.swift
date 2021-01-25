//
//  ViewController.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit
import SDWebImage

class ListingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ItemsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.getItemsList { (itemsList) in
            print(itemsList)
        }
        self.viewModel.onItemsLoadSuccess = {[weak self]  in
            self?.tableView.reloadData()
        }
        self.viewModel.onItemsLoadFail = {[weak self] in
            print("load failed")
        }
    }
    
    
}

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemsList = self.viewModel.getItemsList(), !itemsList.isEmpty {
            return itemsList.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemList = self.viewModel.getItemsList(), !itemList.isEmpty{
            let cell: ItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
            let item = itemList[indexPath.row]
            cell.configureCell(item: item)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.estimatedRowHeight
    }
}

