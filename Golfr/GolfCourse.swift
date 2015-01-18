//
//  GolfCourse.swift
//  Golfr
//
//  Created by Robert McBryde on 22/12/2014.
//  Copyright (c) 2014 fifthsapart. All rights reserved.
//

import UIKit

class GolfCourse: NSObject {
   
    var courseName : String;
    var isNineHoleCourse : Bool;
    var courseTotalPar : Int;
    var coursePars : [Int];
    
    init (courseName: String, isNineHoleCourse: Bool)
    {
        self.courseName = courseName;
        self.isNineHoleCourse = isNineHoleCourse;
        
        if (self.isNineHoleCourse) {
            self.coursePars = [4, 4, 4, 4, 4, 4, 4, 4, 4];
        } else {
            self.coursePars = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4];
        }
        
        self.courseTotalPar = self.coursePars.reduce(0,+);
    }
    
}
