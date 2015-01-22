//
//  AddCourseViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 26/12/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

protocol AddCourseViewControllerDelegate {
    func AddCourseViewControllerDidAdd(controller: AddCourseViewController,golfCourse: GolfCourse);
}



class AddCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
        UITextFieldDelegate, HoleParCellTableViewCellDelegate {
    
    @IBOutlet weak var courseLengthSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var courseParsTableView: UITableView!
    var numberOfHoles:Int = 18;
    var parScores = [Int]();
    
    @IBOutlet weak var CourseNameField: UITextField!
    
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    var golfCourse: GolfCourse = GolfCourse(courseName: "", isNineHoleCourse: false);
    var delegate: AddCourseViewControllerDelegate? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CourseNameField.delegate = self;
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func courseLengthSelector(sender: UISegmentedControl)
    {
        switch courseLengthSegmentControl.selectedSegmentIndex
            {
        case 0:
           self.numberOfHoles = 9;
        case 1:
            self.numberOfHoles = 18;
        default:
            break; 
        }
        self.courseParsTableView.reloadData();
    }
    
        // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfHoles;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("holeParCell") as HoleParCellTableViewCell;
        cell.HoleParCellDelegate = self;
        
        cell.holeNumber.text = "Hole "+String(indexPath.row+1);
//        println("cell: \(cell.holeNumber.text) par score is \(golfCourse.coursePars[indexPath.row])")
        cell.parScore.text = String(golfCourse.coursePars[indexPath.row])
        cell.holeIndex = indexPath.row;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
                return "Hole Pars";
    }


    @IBAction func CancelButton(sender: AnyObject) {
        println("Cancel Add Course Pressed");
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    @IBAction func DoneButton(sender: AnyObject) {
        println("done buton pressed on add course")
        if (delegate != nil)
        {
            golfCourse.courseName = CourseNameField.text;
            delegate!.AddCourseViewControllerDidAdd(self, golfCourse: golfCourse);
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.DoneButton.enabled = !CourseNameField.text.isEmpty;
        return true;
    }
    
    
    
    /* Delegate for HoleParCellTableViewCell */
    func HoleParCellTableViewCellDidChange(cell: HoleParCellTableViewCell) {
        let cellParValue = cell.parScore.text?.toInt();
        golfCourse.coursePars[cell.holeIndex] = cellParValue!;
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
