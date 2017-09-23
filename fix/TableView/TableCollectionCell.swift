//
//  TableCollectionCell.swift
//  fix
//
//  Created by Alex Beattie on 9/23/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit

class TableCollectionCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var mainImageView: UIImageView!
    var listing: Listing? {
        didSet {
            setupThumbNailImage()
            if let listing = listing {
                if let thumnailImageName = listing.mainImage {
                    mainImageView.image = UIImage(named: thumnailImageName)
//                    mainImageView.frame = UIScreen.main.bounds
                }
            }
        }
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    let TableCollectionVC: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collectionView.backgroundColor = UIColor.clear
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collectionView
//    }()
//    
//    
//    
//    
//    func setupViews() {
//        addSubview(TableCollectionVC)
//        
//        
//        
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": TableCollectionVC]))
//
//    }
//    
//    
    func setupThumbNailImage() {
        if let thumbnailImageUrl = listing?.mainImage {
            mainImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        }
    }
}
