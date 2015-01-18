//
//  AddRoundViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 16/11/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

protocol AddRoundViewControllerDelegate {
    func AddRoundViewControllerDidAdd(controller: AddRoundViewController,round: Round);
}

class AddRoundViewController: UIViewController, SelectCourseViewControllerDelegate {
    

    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var currentHandicapTextField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    var roundDelegate: AddRoundViewControllerDelegate? = nil
//    var selectCourseDelegate: SelectCourseViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func textField(textField: UITextField,
//        shouldChangeCharactersInRange range: NSRange,
//        replacementString string: String) -> Bool {
//          
//            var newCourseName = textField.text.stringByReplacingCharactersInRange(range, withString: string);
//            if(newCourseName.length > 0) {
//                self.doneBarButton.enabled = true;
//            } else {
//                self.doneBarButton.enabled = false;
//            }
//    }

    @IBAction func done(sender: AnyObject) {
        println("You entered the courseName as :\(courseNameTextField.text)");
        if (courseNameTextField != nil && !courseNameTextField.text.isEmpty)
        {
            let round = Round(courseName: courseNameTextField.text, currentHandicap: currentHandicapTextField.text.toInt());
        
//        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
            if (roundDelegate != nil)
            {
                roundDelegate!.AddRoundViewControllerDidAdd(self, round: round);
          
            }
        }
    }

    @IBAction func cancel(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    
    func SelectRoundViewControllerDidSelectCourse(controller: SelectCourseTableViewController,golfCourse: GolfCourse){
        println("in Add round controller SelectRoundViewControllerDidSelectCourse has been called")
        self.courseNameTextField.text = golfCourse.courseName;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "selectCourseSegue"{
            println("In add round preparing for segue to Select course")
            let navigationController = segue.destinationViewController as UINavigationController
            
            let vc = navigationController.viewControllers[0] as SelectCourseTableViewController
            vc.delegate = self
        }
    }

}
