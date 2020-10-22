//
//  User.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/17/20.
//

import Foundation

class User {
    var name : String = ""
    var email : String = ""
    var countOfJobs : Int = 0
//    var jobName : String = ""
//    var jobMounthlySalary : Int = 0
    var job : [Job] = []
    var countOfDebitCards : Int = 0
    var debitCardName : String = ""
    var debitCardAmountOfMoney : Int = 0
    var mounthlySpentName : String = ""
    var mounthlySpentSum : Int = 0
    var mounthlySpentDate : Date = Date()
}

class Job {
    var name : String = ""
    var salary : Int = 0
}


