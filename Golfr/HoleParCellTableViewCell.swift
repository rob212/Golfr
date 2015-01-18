//
//  HoleParCellTableViewCell.swift
//  Golfr
//
//  Created by Robert McBryde on 28/12/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit


protocol HoleParCellTableViewCellDelegate {
    func HoleParCellTableViewCellDidChange(cell: HoleParCellTableViewCell);
}

class HoleParCellTableViewCell: UITableViewCell {

    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var parScore: UILabel!
    var holeIndex = 0;
    var HoleParCellDelegate: HoleParCellTableViewCellDelegate? = nil
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func minusParButton(sender: UIButton) {
        var currentPar = parScore.text?.toInt();
        if (currentPar > 3){
            currentPar = currentPar! - 1;
        }
        self.parScore.text = String(currentPar!);
        HoleParCellDelegate?.HoleParCellTableViewCellDidChange(self);
    }
    
    @IBAction func plusParButton(sender: UIButton) {
        var currentPar = parScore.text?.toInt();
        if (currentPar < 5){
            currentPar = currentPar! + 1;
        }
        self.parScore.text = String(currentPar!);
        HoleParCellDelegate?.HoleParCellTableViewCellDidChange(self);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
