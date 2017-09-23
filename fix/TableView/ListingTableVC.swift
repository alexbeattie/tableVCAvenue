//
//  ListingTableVC.swift
//  fix
//
//  Created by Alex Beattie on 9/23/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit

class ListingTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var listings:[Listing]?
    
    
    func fetchListings() {
        ApiService.sharedInstance.fetchListings { (listings: [Listing]) in
            
            self.listings = listings
            
            self.listingTable?.reloadData()
            
        }
    }
    @IBOutlet weak var listingTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListings()
        listingTable.dataSource = self
        listingTable.delegate = self
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = listings?.count {
            return count
        }
        return 0

    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listingTable.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! ListingCell
        if let listing = listings?[indexPath.row] {
            cell.listing = listing
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollectionDetail" {
            let detailViewController = segue.destination as! TableCollectionVC
            detailViewController.listings = [sender as! Listing]
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listing = listings![indexPath.item]
        performSegue(withIdentifier: "toCollectionDetail", sender: listing)
    }
 
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetailVC" {
//            let detailViewController = segue.destination as! DetailViewController
//            detailViewController.listing = sender as? Listing
//        }
//    }
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let listing = listings![indexPath.item]
//        performSegue(withIdentifier: "toDetailVC", sender: listing)
//    }



}
