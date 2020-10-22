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
    @IBOutlet weak var errorLabelOutlet: UILabel!
    @IBOutlet weak var addMoreMounthlySpentOutlet: UIButton!
    let defaults = UserDefaults.standard
    let userInfo = User()
    let jobInfo = Job()
    var userStates : UserState = .countOfJobs
    var state:String = "countOfJobs"
    var countJobs:Int = 1
    var countCards: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cirlceButton.layer.cornerRadius = 20
        circleView.layer.cornerRadius = 20
        
        firstQuestionTextOutlet.text = "How many jobs do you have?"
        firstTextFieldOutlet.isHidden = false
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if state == "countOfJobs" {
            if firstTextFieldOutlet.text != "" {
                print("countOfJobs")
                defaults.setValue(firstTextFieldOutlet.text, forKey: "CountOfJobs")
                defaults.synchronize()
                userInfo.countOfJobs = Int(firstTextFieldOutlet.text!)!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                userStates = UserState.companyName
                state = "companyName"
                firstQuestionTextOutlet.text = "What your company name?"
                errorLabelOutlet.isHidden = true
                circleImageOutlet.image = UIImage.init(named: "downloadCirculeTwo")
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about count of your jobs"
            }
        } else if ((state == "companyName") && (countJobs <= userInfo.countOfJobs)) {
            if firstTextFieldOutlet.text != "" {
                print("CompanyName")
                defaults.setValue(firstTextFieldOutlet.text, forKey: "CompanyName")
                defaults.synchronize()
                jobInfo.name = firstTextFieldOutlet.text!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                firstQuestionTextOutlet.text = "What your mounthly salary at \(String(describing: UserDefaults.standard.object(forKey: "CompanyName") as? String)) job?"
                userStates = UserState.mounhtlySalary
                state = "mounthlySalary"
                countJobs += 1
                errorLabelOutlet.isHidden = true
                circleImageOutlet.image = UIImage.init(named: "downloadCirculeThree")
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about your company"
            }
        } else if state == "mounthlySalary" {
            if firstTextFieldOutlet.text != "" {
                print("MounthlySalary")
                defaults.set(firstTextFieldOutlet.text, forKey: "mounthlySalary")
                defaults.synchronize()
                jobInfo.salary = Int(firstTextFieldOutlet.text!)!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                if (countJobs <= userInfo.countOfJobs) {
                    firstQuestionTextOutlet.text = "What your company name?"
                    state = "companyName"
                } else {
                    state = "countOfDebitCards"
                    firstQuestionTextOutlet.text = "How many debit cards do you have?"
                    circleImageOutlet.image = UIImage.init(named: "downloadCirculeFour")
                }
                errorLabelOutlet.isHidden = true
                
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about your mounthly salary"
            }
            
            
        } else if state == "countOfDebitCards" {
            if firstTextFieldOutlet.text != "" {
                print("CountOfDebitCards")
                defaults.setValue(firstTextFieldOutlet.text, forKey: "CountOfDebitCards")
                defaults.synchronize()
                userInfo.countOfDebitCards = Int(firstTextFieldOutlet.text!)!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                userStates = UserState.nameOfDebitCard
                state = "nameOfDebitCard"
                firstQuestionTextOutlet.text = "Name of debit card?"
                errorLabelOutlet.isHidden = true
                circleImageOutlet.image = UIImage.init(named: "downloadCirculeFive")
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about count of your debit cards"
            }
            //Before everythings work good!
            
            
        } else if ((state == "nameOfDebitCard") && (countCards <= userInfo.countOfDebitCards)) {
            if firstTextFieldOutlet.text != "" {
                print("NameOfDebitCard")
                defaults.setValue(firstTextFieldOutlet.text, forKey: "NameOfDebitCard")
                defaults.synchronize()
                userInfo.debitCardName = firstTextFieldOutlet.text!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                firstQuestionTextOutlet.text = "How much money do you have on \(String(describing: UserDefaults.standard.object(forKey: "NameOfDebitCard") as? String)) debit card?"
                userStates = UserState.moneyOnDebitcard
                state = "moneyOnDebitcard"
                countCards += 1
                errorLabelOutlet.isHidden = true
                circleImageOutlet.image = UIImage.init(named: "downloadCirculeSix")
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about debit card"
            }
        } else if state == "moneyOnDebitcard" {
            if firstTextFieldOutlet.text != "" {
                print("MoneyOnDebitcard")
                defaults.set(firstTextFieldOutlet.text, forKey: "MoneyOnDebitcard")
                defaults.synchronize()
                userInfo.debitCardAmountOfMoney = Int(firstTextFieldOutlet.text!)!
                print(firstTextFieldOutlet.text as Any)
                firstTextFieldOutlet.text = ""
                if (countCards <= userInfo.countOfDebitCards) {
                    firstQuestionTextOutlet.text = "Name of debit card?"
                    state = "nameOfDebitCard"
                } else {
                    state = "mounthlySpent"
                    firstQuestionTextOutlet.text = "What your mounthly spent?"
                    secondTextFieldOutlet.isHidden = false
                    thirdTextFieldOutlet.isHidden = false
                    
                    //??????????
                    firstTextFieldOutlet.placeholder = "Name"
                    secondTextFieldOutlet.placeholder = "Price"
                    thirdTextFieldOutlet.placeholder = "Date"
                    addMoreMounthlySpentOutlet.isHidden = false
                    //??????????
                    circleImageOutlet.image = UIImage.init(named: "downloadCirculeSeven")
                }
//                errorLabelOutlet.isHidden = true
//                circleImageOutlet.image = UIImage.init(named: "downloadCirculeSix")
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out information about your money on debit card"
            }
        } else if state == "mounthlySpent" {
            if (firstTextFieldOutlet.text != "" && secondTextFieldOutlet.text != "" && thirdTextFieldOutlet.text != "") {
                print("MounthlySpentName")
                defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySpentName")
                defaults.synchronize()
                defaults.set(secondTextFieldOutlet.text, forKey: "MounthlySpentSum")
                defaults.synchronize()
                defaults.set(thirdTextFieldOutlet.text, forKey: "MounthlySpentDate")
                defaults.synchronize()
                
                userInfo.mounthlySpentName = firstTextFieldOutlet.text!
                userInfo.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
                userInfo.mounthlySpentDate = Date(timeIntervalSinceNow: 2)
                print(firstTextFieldOutlet.text as Any)
                print(secondTextFieldOutlet.text as Any)
                print(thirdTextFieldOutlet.text as Any)
                
                congratulationsMessageOutlet.isHidden = false
                firstQuestionTextOutlet.isHidden = true
                firstTextFieldOutlet.isHidden = true
                secondTextFieldOutlet.isHidden = true
                thirdTextFieldOutlet.isHidden = true
                
                errorLabelOutlet.isHidden = true
                addMoreMounthlySpentOutlet.isHidden = true
                circleImageOutlet.image = UIImage.init(named: "DoneCircule")
                cirlceButton.setTitle("Done", for: .normal)
                
                state = "nextController"
            } else {
                errorLabelOutlet.isHidden = false
                errorLabelOutlet.text = "Please fill out all information about your mounthly spent"
            }
        } else if state == "nextController" {
            let mainVC = UIViewController.getFromStoryboard(withId: "MainTabBarController") as! MainTabBarController
            navigationController?.pushViewController(mainVC, animated: true)
        } else {
            print("Error")
        }
    }
    
    
    @IBAction func addMoreMounthlySpent(_ sender: Any) {
        state = "mounthlySpent"
        
        if (firstTextFieldOutlet.text != "" && secondTextFieldOutlet.text != "" && thirdTextFieldOutlet.text != "") {
            print("MounthlySpentName")
            defaults.set(firstTextFieldOutlet.text, forKey: "MounthlySpentName")
            defaults.synchronize()
            defaults.set(secondTextFieldOutlet.text, forKey: "MounthlySpentSum")
            defaults.synchronize()
            defaults.set(thirdTextFieldOutlet.text, forKey: "MounthlySpentDate")
            defaults.synchronize()
            
            userInfo.mounthlySpentName = firstTextFieldOutlet.text!
            userInfo.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
            userInfo.mounthlySpentDate = Date(timeIntervalSinceNow: 2)
            
            print(firstTextFieldOutlet.text as Any)
            print(secondTextFieldOutlet.text as Any)
            print(thirdTextFieldOutlet.text as Any)
            
            firstTextFieldOutlet.text = ""
            secondTextFieldOutlet.text = ""
            thirdTextFieldOutlet.text = ""
            
            errorLabelOutlet.isHidden = true
        } else {
            errorLabelOutlet.isHidden = false
            errorLabelOutlet.text = "Please fill out all information about your mounthly spent"
        }
        
    }
    
    
    func printAll() {
        print(defaults.value(forKey: "Name") as Any)
        print(defaults.value(forKey: "Email") as Any)
        print(defaults.value(forKey: "CountOfJobs") as Any)
        print(defaults.value(forKey: "FirstCompanyName") as Any)
    }
    
    
    
}
