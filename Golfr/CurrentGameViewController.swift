//
//  CurrentGameViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 01/02/2015.
//  Copyright (c) 2015 fifthsapart. All rights reserved.
//

import UIKit

protocol CurrentGameViewControllerDelegate {
    func CurrentGameViewControllerSelectedCurrentRound(controller: CurrentGameViewController,round: Round);
}

class CurrentGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HoleParCellTableViewCellDelegate {
    
    var currentRound : Round?
    var currentGameDelegate : CurrentGameViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("holeParCell") as HoleParCellTableViewCell;
      
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            return "Your strokes";
    }
    
    /* Delegate for HoleParCellTableViewCell */
    func HoleParCellTableViewCellDidChange(cell: HoleParCellTableViewCell) {
        let cellParValue = cell.parScore.text?.toInt();
        if let tempCourse = currentRound?.golfCourse {
            tempCourse.coursePars[cell.holeIndex] = cellParValue!;
        }
    }


}
