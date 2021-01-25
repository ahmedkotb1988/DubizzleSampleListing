//
//  ListingDetailsViewController.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 25/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit

class ListingDetailsViewController: UIViewController {
    
    @IBOutlet weak var ItemDateLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var listModel: ItemsListModel?
    let viewModel = ItemsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let item = self.listModel {
            self.itemNameLabel.text = item.name
            self.itemPriceLabel.text = item.price
            self.ItemDateLabel.text = self.viewModel.getFormattedDate(createdDate: item.created_at ?? "")
            if let imageURL = item.image_urls?.first{
                self.itemImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
            }
        }
    }
    
}
