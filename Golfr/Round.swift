//
//  Round.swift
//  Golfr
//
//  Created by Robert McBryde on 16/11/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

class Round: NSObject {
    
    var golfCourse : GolfCourse
    var currentHandicap : Int
    var dateOfRound : NSDate
    var score : Int
    
    init(course:GolfCourse, currentHandicap:Int?, score:Int){
        self.golfCourse = course
        self.currentHandicap = 10
        self.dateOfRound = NSDate()
        self.score = score
    }
   
}
