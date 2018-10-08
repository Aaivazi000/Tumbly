//
//  DetailPhotoViewController.swift
//  tumbly
//
//  Created by Andriana Aivazians on 10/7/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController {

    //Declarations & UI Element Outlets
    var detailposts: [String: Any]?
    @IBOutlet weak var postphotoImageView: UIImageView!
    @IBOutlet weak var postcaptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change color of back button on navigation controller
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        
        //Load info from post into UI elements
        if let detailphotos = detailposts?["photos"] as? [[String: Any]] {
            //Get url for photo
            let detailphoto = detailphotos[0]
            let origSize = detailphoto["original_size"] as! [String: Any]
            let origSizeURLString = origSize["url"] as! String
            let detailphotoURL = URL(string: origSizeURLString)!
            //Use photo url to set image to imageview
            postphotoImageView.af_setImage(withURL: detailphotoURL)
        }
        //Load caption into UI Label
        
        var captionString = detailposts?["caption"] as! String
        captionString = captionString.replacingOccurrences(of: "<p>", with: "")
        captionString = captionString.replacingOccurrences(of: "<br/>", with: "\n")
        captionString = captionString.replacingOccurrences(of: "</p>", with: "")
        postcaptionLabel.text = captionString
        
        
    }
    

    
//Closes out the class
}
