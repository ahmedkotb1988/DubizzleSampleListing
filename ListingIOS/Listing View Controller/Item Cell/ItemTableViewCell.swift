//
//  ItemTableViewCell.swift
//  ListingIOS
//
//  Created by Ahmed Kotb on 24/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import UIKit
import SDWebImage

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    let viewModel = ItemsListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(item: ItemsListModel) {
        self.nameLabel.text = item.name
        self.priceLabel.text = item.price
        if let imageURL = item.image_urls_thumbnails?.first{
            self.itemImageView.sd_setImage(with: URL.init(string: imageURL), completed: nil)
        }
        if let date = item.created_at {
            self.createdAtLabel.text = self.viewModel.getFormattedDate(createdDate: date)
        }
    }

}
