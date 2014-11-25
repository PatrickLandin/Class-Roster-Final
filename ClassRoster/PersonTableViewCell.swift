//
//  PersonTableViewCell.swift
//  ClassRoster
//
//  Created by Patrick Landin on 11/17/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}