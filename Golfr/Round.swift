//
//  Round.swift
//  Golfr
//
//  Created by Robert McBryde on 16/11/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

class Round: NSObject {
    
    var courseName : String;
    var currentHandicap : Int;
    var dateOfRound : NSDate;
    var score : Int = 0;
    
    init(courseName:String, currentHandicap:Int?){
        self.courseName = courseName;
        self.currentHandicap = 10;
        self.dateOfRound = NSDate();
    }
   
}
