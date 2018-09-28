//
//  PhotosViewController.swift
//  tumbly
//
//  Created by Andriana Aivazians on 9/28/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PhotosViewController: UIViewController {
    
    //Declarations (UI, var, constants
    var posts: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //Network Request
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(dataDictionary)
                
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                print(responseDictionary)
                // TODO: Reload the table view
            }
        }
        task.resume()
        
        
    
    //The Bracket below closes the viewDidLoad function
    }
    
    
//The Bracket below is the closing bracket of the View Controller
}
