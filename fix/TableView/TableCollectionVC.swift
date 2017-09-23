//
//  TableCollectionVC.swift
//  fix
//
//  Created by Alex Beattie on 9/23/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit

class TableCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   

    var listings = [Listing]()
//    var slides = [Slide]()
    
    @IBOutlet weak var detailsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsCollection.delegate = self
        detailsCollection.dataSource = self

 

        
        fetchListings()
    
    }
   
    

    
    func fetchListings() {
        ApiService.sharedInstance.fetchListings { (listings: [Listing]) in
            
            self.listings = listings
            
            self.detailsCollection?.reloadData()
            print(listings)
            
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: detailsCollection.frame.size.width - 10, height: detailsCollection.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listings.count
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width,  height: frame.width)
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = detailsCollection.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as?     TableCollectionCell {
            let listing = listings[indexPath.row]
            cell.listing = listing
        
            return cell 
        } else {
            
        return TableCollectionCell()
        }
    }
}
