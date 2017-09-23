//
//  ListingCell.swift
//  fix
//
//  Created by Alex Beattie on 9/23/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {

    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func prepareForReuse() {
        titleLabel.text = ""
        subTitleLabel.text = ""
    }
    var listing: Listing? {
        didSet {
            setupThumbNailImage()
            if let listing = listing {
                titleLabel.text = listing.address?.capitalized
                if let listPrice = listing.listPrice {
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    
                    let subTitleText = "\(numberFormatter.string(from: listPrice)!)"
                    subTitleLabel.text = subTitleText
                }
                if let thumnailImageName = listing.mainImage {
                    thumbNailImageView.image = UIImage(named: thumnailImageName)
                }
                
                
            }
            
        }
    }
    func setupThumbNailImage() {
        if let thumbnailImageUrl = listing?.mainImage {
            thumbNailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        }
    }
}
