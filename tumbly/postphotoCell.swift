//
//  postphotoCell.swift
//  tumbly
//
//  Created by Andriana Aivazians on 9/28/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class postphotoCell: UITableViewCell {

    //UI Declaration
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
