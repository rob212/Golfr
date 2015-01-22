//
//  PreviousRoundTableViewCell.swift
//  Golfr
//
//  Created by Robert McBryde on 22/01/2015.
//  Copyright (c) 2015 fifthsapart. All rights reserved.
//

import UIKit

class PreviousRoundTableViewCell: UITableViewCell {

    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var playedDate: UILabel!
    @IBOutlet weak var Score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
