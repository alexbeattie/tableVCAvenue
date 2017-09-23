//
//  SlideApiService.swift
//  fix
//
//  Created by Alex Beattie on 9/23/17.
//  Copyright © 2017 Artisan Branding. All rights reserved.
//

import UIKit


struct Address: Decodable {
    var full: String
}

struct Property: Decodable {
    var bathsFull: Int
    var bathsHalf: Int
    var bedrooms: Int
}
struct Geo: Decodable {
    var lat: Float
    var lng: Float
}
struct ListingInfo: Decodable {
    var listPrice: Int
    var photos: [String]
    var address: Address
    var mlsId: Int
    var listingId: String
    var property: Property
    var geo: Geo
    var remarks: String
}




class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListingInfo { (listingInfo) -> () in
            
        }
    }
    
    func fetchListingInfo(_ completionHandler: @escaping ([ListingInfo]) -> ()) {
        let baseUrl = URL(string: "http://localhost:8888/simplyrets/file.js")
        let task = URLSession.shared.dataTask(with: baseUrl!) { (data, response, error) in
            
            guard let data = data else { return }
            if let error = error {
                print(error)
            }
            
            do {
                
                let decoder = JSONDecoder()
                let listingInfo = try decoder.decode([ListingInfo].self, from: data)
                
                //                let listingInfo = try decoder.decode(Address.self, from: data)
                print(listingInfo)
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(listingInfo)
                })
            } catch let err {
                print(err)
            }
            
        }
        task.resume()
    }
}

