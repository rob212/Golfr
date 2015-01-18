//
//  ViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 16/11/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit


class HomeController: UITableViewController, AddRoundViewControllerDelegate  {

    
    @IBOutlet var roundsTableView: UITableView!
    
    var currentRounds = [Round]();
    var previousRounds = [Round]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Just some initial dummy data to test the code, this will be removed at a later date
        previousRounds.append( Round(courseName:"Kingknowe", currentHandicap:nil));
        var oldRound = Round(courseName: "Ratho", currentHandicap: nil);
        var oldTime = NSDate();
        oldTime.dateByAddingTimeInterval(NSTimeInterval(-260000));
        oldRound.dateOfRound = oldTime;
        previousRounds.append(oldRound)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("PreviousRoundItem") as UITableViewCell;
            
            if (indexPath.section==0) {
                if (!currentRounds.isEmpty)
                {
                    cell.textLabel!.text = (currentRounds[indexPath.row] as Round).courseName;
                    cell.detailTextLabel!.text = (currentRounds[indexPath.row] as Round).dateOfRound.description;
                }
            }
            else {
                cell.textLabel!.text = (previousRounds[indexPath.row] as Round).courseName;
                cell.detailTextLabel!.text = (previousRounds[indexPath.row] as Round).dateOfRound.description;
            }
            
            
            
            return cell;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if (section == 0){
                return currentRounds.count;
            } else {
                return 2;
            }
    }
    
    override func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            if (section == 0) {
                return "Current Round";
            } else {
                return "Previous Rounds";
            }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "addRoundSegue"{
            let navigationController = segue.destinationViewController as UINavigationController
            
            let vc = navigationController.viewControllers[0] as AddRoundViewController
            vc.roundDelegate = self
        }
    }
    
    func AddRoundViewControllerDidAdd(controller: AddRoundViewController,round: Round)
    {
        self.currentRounds.append(round);
        self.roundsTableView.reloadSections(NSIndexSet(index:0), withRowAnimation: UITableViewRowAnimation.None)
       self.dismissViewControllerAnimated(true, nil)
        
    }
    

}

