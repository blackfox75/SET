//
//  jbosQuestionViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/21/20.
//

import UIKit

class JobsQuestionViewController: UIViewController {
    
    @IBOutlet weak var firstQuestionTextOutlet: UILabel!
    @IBOutlet weak var secondQuestionTextOutlet: UILabel!
    @IBOutlet weak var firstTextFieldOutlet: UITextField!
    @IBOutlet weak var secondTextFieldOutlet: UITextField!
    @IBOutlet weak var thirdTextFieldOutlet: UITextField!
    @IBOutlet weak var congratulationsMessageOutlet: UILabel!
    @IBOutlet weak var circleImageOutlet: UIImageView!
    @IBOutlet weak var buttonTextOutlet: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var cirlceButton: UIButton!
    let defaults = UserDefaults.standard
    let userInfo = User()
    let jobInfo = Job()
    var userStates : UserState = .countOfJobs
    var state:String = "countOfJobs"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cirlceButton.layer.cornerRadius = 20
        circleView.layer.cornerRadius = 20
        
        firstQuestionTextOutlet.text = "How many jobs do you have?"
        firstTextFieldOutlet.isHidden = false
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        //        switch userStates {
        //        case .countOfJobs: do {
        //            defaults.set(firstTextFieldOutlet.text, forKey: "CountOfJobs")
        //            userInfo.countOfJobs = Int(firstTextFieldOutlet.text!)!
        //            firstTextFieldOutlet.text = ""
        //            userStates = UserState.companyName
        //            firstQuestionTextOutlet.text = "What your company name?"
        //        }
        //        case .companyName: do {
        //            if let count = UserDefaults.standard.object(forKey: "CountOfJobs") as? Int {
        //                for _ in 0...count {
        //                    defaults.set(firstTextFieldOutlet.text, forKey: "CompanyName")
        //                    jobInfo.name = firstTextFieldOutlet.text!
        //                    firstTextFieldOutlet.text = ""
        //                    firstQuestionTextOutlet.text = "What your mounthly salary at \(UserDefaults.standard.object(forKey: "CompanyName") as? String) job?"
        //                    userStates = UserState.mounhtlySalary
        //                }
        //                userStates = UserState.countOfDebitCards
        //                firstQuestionTextOutlet.text = "How many debit cards do you have?"
        //            }
        //        }
        //
        //        case .mounhtlySalary: do {
        //            defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySalary")
        //            jobInfo.salary = Int(firstTextFieldOutlet.text!)!
        //            firstTextFieldOutlet.text = ""
        //        }
        //
        //        case .countOfDebitCards: do {
        //            defaults.set(firstTextFieldOutlet.text, forKey: "CountOfDebitCards")
        //            userInfo.countOfDebitCards = Int(firstTextFieldOutlet.text!)!
        //            firstTextFieldOutlet.text = ""
        //            userStates = UserState.companyName
        //            firstQuestionTextOutlet.text = "How many debit cards do you have?"
        //        }
        //
        //        case .nameOfDebitCard: do {
        //            if let count = UserDefaults.standard.object(forKey: "CountOfDebitCards") as? Int {
        //                for _ in 0...count {
        //                    defaults.set(firstTextFieldOutlet.text, forKey: "NameOfDebitCard")
        //                    jobInfo.salary = Int(firstTextFieldOutlet.text!)!
        //                    firstTextFieldOutlet.text = ""
        //                    firstQuestionTextOutlet.text = "What your amount of money at \(UserDefaults.standard.object(forKey: "NameOfDebitCard") as? String) job?"
        //                    userStates = UserState.moneyOnDebitcard
        //                }
        //                userStates = UserState.mounthlySpent
        //                firstQuestionTextOutlet.text = "What is your mounthly spent?"
        //            }
        //        }
        //
        //        case .moneyOnDebitcard: do {
        //            defaults.set(firstTextFieldOutlet.text, forKey: "MoneyOnDebitCards")
        //            userInfo.debitCardAmountOfMoney = Int(firstTextFieldOutlet.text!)!
        //            firstTextFieldOutlet.text = ""
        //            userStates = UserState.mounthlySpent
        //        }
        //
        //        case .mounthlySpent: do {
        //            defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySpent")
        //            userInfo.mounthlySpent = Int(firstTextFieldOutlet.text!)!
        //            firstTextFieldOutlet.text = ""
        //            congratulationsMessageOutlet.isHidden = false
        //            firstQuestionTextOutlet.isHidden = true
        //            firstTextFieldOutlet.isHidden = true
        //        }
        //        default:
        //            printAll()
        //        }
        
        if state == "countOfJobs" {
            defaults.set(firstTextFieldOutlet.text, forKey: "CountOfJobs")
            userInfo.countOfJobs = Int(firstTextFieldOutlet.text!)!
            firstTextFieldOutlet.text = ""
            userStates = UserState.companyName
            state = "companyName"
            firstQuestionTextOutlet.text = "What your company name?"
        }
        if state == "companyName" {
            if let count = UserDefaults.standard.object(forKey: "CountOfJobs") as? Int {
                for _ in 0...count {
                    defaults.set(firstTextFieldOutlet.text, forKey: "CompanyName")
                    jobInfo.name = firstTextFieldOutlet.text!
                    firstTextFieldOutlet.text = ""
                    firstQuestionTextOutlet.text = "What your mounthly salary at \(UserDefaults.standard.object(forKey: "CompanyName") as? String) job?"
                    userStates = UserState.mounhtlySalary
                    state = "mounthlySalary"
                }
                userStates = UserState.countOfDebitCards
                state = "countOfDebitCards"
                firstQuestionTextOutlet.text = "How many debit cards do you have?"
            }
        } else if state == "mounthlySalary" {
            defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySalary")
            jobInfo.salary = Int(firstTextFieldOutlet.text!)!
            firstTextFieldOutlet.text = ""
        } else if state == "countOfDebitCards" {
            defaults.set(firstTextFieldOutlet.text, forKey: "CountOfDebitCards")
            userInfo.countOfDebitCards = Int(firstTextFieldOutlet.text!)!
            firstTextFieldOutlet.text = ""
            userStates = UserState.companyName
            state = "nameOfDebitCard"
            firstQuestionTextOutlet.text = "How many debit cards do you have?"
        } else if state == "nameOfDebitCard" {
            if let count = UserDefaults.standard.object(forKey: "CountOfDebitCards") as? Int {
                for _ in 0...count {
                    defaults.set(firstTextFieldOutlet.text, forKey: "NameOfDebitCard")
                    jobInfo.salary = Int(firstTextFieldOutlet.text!)!
                    firstTextFieldOutlet.text = ""
                    firstQuestionTextOutlet.text = "What your amount of money at \(UserDefaults.standard.object(forKey: "NameOfDebitCard") as? String) job?"
                    userStates = UserState.moneyOnDebitcard
                    state = "moneyOnDebitcard"
                }
                userStates = UserState.mounthlySpent
                state = "mounthlySpent"
                firstQuestionTextOutlet.text = "What is your mounthly spent?"
            }
        } else if state == "moneyOnDebitcard" {
            defaults.set(firstTextFieldOutlet.text, forKey: "MoneyOnDebitCards")
            userInfo.debitCardAmountOfMoney = Int(firstTextFieldOutlet.text!)!
            firstTextFieldOutlet.text = ""
            userStates = UserState.mounthlySpent
            state = "mounthlySpent"
        } else if state == "mounthlySpent" {
            defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySpent")
            userInfo.mounthlySpent = Int(firstTextFieldOutlet.text!)!
            firstTextFieldOutlet.text = ""
            congratulationsMessageOutlet.isHidden = false
            firstQuestionTextOutlet.isHidden = true
            firstTextFieldOutlet.isHidden = true
        } else {
            print("Error")
        }
    }
    
    func printAll() {
        print(defaults.value(forKey: "Name"))
        print(defaults.value(forKey: "Email"))
        print(defaults.value(forKey: "CountOfJobs"))
        print(defaults.value(forKey: "FirstCompanyName"))
    }
    
}
