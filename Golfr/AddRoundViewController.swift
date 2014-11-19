//
//  AddRoundViewController.swift
//  Golfr
//
//  Created by Robert McBryde on 16/11/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

protocol AddRoundViewControllerDelegate {
    func AddRoundViewControllerDidCancel(controller: AddRoundViewController);
    func AddRoundViewControllerDidAdd(controller: AddRoundViewController,round: Round);
}

class AddRoundViewController: UIViewController {
    

    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var currentHandicapTextField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
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
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
}
