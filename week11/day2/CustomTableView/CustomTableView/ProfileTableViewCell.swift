//
//  ProfileTableViewCell.swift
//  CustomTableView
//
//  Created by Ryan Wijaya on 7/05/2015.
//  Copyright (c) 2015 rnwcorp. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
            // if this was to be divided by 4 it will become rounded corner edges
            
            self.profileImageView.layer.masksToBounds = true
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
