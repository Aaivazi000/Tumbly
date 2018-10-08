//
//  PhotosViewController.swift
//  tumbly
//
//  Created by Andriana Aivazians on 9/28/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDataSource {
    
    //Declarations (UI, var, constants
    var posts: [[String: Any]] = []
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    let alertController = UIAlertController(title: "Network Error", message: "Cannot connect to internet. Please check your network connection", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertController.addAction(cancelAction)
        
        //TableView Handling
        tableView.dataSource = self
        tableView.rowHeight = 196
        
        //Setup Refresh Control
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(PhotosViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)

        //Make Network Request
        fetchpostphotos()
        
    //The Bracket below closes the viewDidLoad function
    }
    
    @objc func didPullToRefresh (_ refreshControl: UIRefreshControl) {
        fetchpostphotos()
    }
    
    //Network Request Handling
    func fetchpostphotos() {
        
        //Check for Network Connection
        if ConnectionCheck.isConnectedToNetwork() == true {
            //This will run when there is internet connection
            //Network Request
            let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    //print(dataDictionary)
                    
                    let responseDictionary = dataDictionary["response"] as! [String: Any]
                    self.posts = responseDictionary["posts"] as! [[String: Any]]
                    self.tableView.reloadData()
                    //Stop Refreshing
                    self.refreshControl.endRefreshing()
                }
            }
            task.resume()
        }
        else {
            //this will run when there is no connection
            present(alertController, animated: true)
        }
    }
    
    //UITableView Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postphotoCell", for: indexPath) as! postphotoCell
            let post = posts[indexPath.row]
            let summaryString = post["summary"] as! String
            
            //Move Summary data into Label
            cell.summaryLabel.text = summaryString
            
            if let photos = post["photos"] as? [[String: Any]] {
            //Get the photo uRL
                let photo = photos[0]
                let origSize = photo["original_size"] as! [String: Any]
                let photourlString = origSize["url"] as! String
                let photoURL = URL(string: photourlString)
            
                //Use Alamofire image to go and get the post images
                cell.photoImageView.af_setImage(withURL: photoURL!)
            }
        return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let post = posts[indexPath.row]
            let detailphotoViewController = segue.destination as! DetailPhotoViewController
            detailphotoViewController.detailposts = post
        }
    }
    
//The Bracket below is the closing bracket of the View Controller
}
