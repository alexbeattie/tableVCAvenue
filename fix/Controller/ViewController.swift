//
//  ViewController.swift
//  fix
//
//  Created by Alex Beattie on 9/19/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var listings:[Listing]?
    
    
    func fetchListings() {
        ApiService.sharedInstance.fetchListings { (listings: [Listing]) in
            
            self.listings = listings
            
                self.collectionView?.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        fetchListings()
     
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)

}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return listings?.count ?? 0
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // everytime deqeue is called, the cell initWith frame is called
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ListingsCollectionCell

        if let listing = listings?[indexPath.item] {
            
            cell.listing = listing
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.listing = sender as? Listing
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listing = listings![indexPath.item]
        performSegue(withIdentifier: "toDetailVC", sender: listing)
    }


   
    
}




