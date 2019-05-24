//
//  RequestCell.swift
//  Outsource
//
//  Created by APPLE on 5/24/19.
//  Copyright © 2019 Bong. All rights reserved.
//

import UIKit

class RequestCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var requestTitleLabel: UILabel!
    @IBOutlet weak var requestDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didApply(_ sender: UIButton) {
    }
    
    @IBAction func didMessage(_ sender: UIButton) {
    }
    
}
