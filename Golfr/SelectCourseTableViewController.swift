//
//  SelectCourseTableViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 26/12/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

protocol SelectCourseViewControllerDelegate {
    func SelectRoundViewControllerDidSelectCourse(controller: SelectCourseTableViewController,golfCourse: GolfCourse);
}

class SelectCourseTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, AddCourseViewControllerDelegate {
    
    var courses = [GolfCourse]();
    

    @IBOutlet var CourseTableView: UITableView!
    var delegate: SelectCourseViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courses.append(GolfCourse(courseName:"Kingsknowe", isNineHoleCourse:false));
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return courses.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("courseCell", forIndexPath: indexPath) as UITableViewCell

        if (!courses.isEmpty)
        {
            cell.textLabel!.text = (courses[indexPath.row] as GolfCourse).courseName;
        }

        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        println("In select course about to segue to add course");
        var selectedCourse : GolfCourse?;
        if sender is GolfCourse {
             selectedCourse = sender as? GolfCourse;
        }
        if segue.identifier == "addCourseSegue"{
            let navigationController = segue.destinationViewController as UINavigationController
            let vc = navigationController.viewControllers[0] as AddCourseViewController
            vc.delegate = self
            if (selectedCourse != nil){
                vc.golfCourse = selectedCourse;
            }
        }
    }

    
    func AddCourseViewControllerDidAdd(controller: AddCourseViewController,golfCourse: GolfCourse)
    {
        self.courses.append(golfCourse);
        self.CourseTableView.reloadSections(NSIndexSet(index:0), withRowAnimation: UITableViewRowAnimation.None)
        self.dismissViewControllerAnimated(true, nil)
        
    }
    
    
    @IBAction func cancelCourseSelection(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var selectedCourse:GolfCourse = courses[indexPath.row];
         println("selected \(selectedCourse.courseName)")
        if (delegate != nil)
        {
            delegate!.SelectRoundViewControllerDidSelectCourse(self, golfCourse: selectedCourse);
            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
        }

    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Edit", handler:{action, indexpath in
            self.performSegueWithIdentifier("addCourseSegue", sender: self.courses[indexPath.row]);
        });
        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        
        var deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:{action, indexpath in
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        });
        
        return [deleteRowAction, moreRowAction];
    }
    
   

    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
