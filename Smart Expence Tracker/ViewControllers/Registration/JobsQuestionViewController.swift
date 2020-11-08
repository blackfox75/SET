//
//  jbosQuestionViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/21/20.
//

import UIKit

class JobsQuestionViewController: UIViewController { //, UserDefaultsProtocol {
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
    let debitCardInfo = DebitCard()
    let mounthlySpent = MounthlySpent()
    let jobInfo = Job()
    var masOfUserInfo : [User] = []
    var masOfDebitCards: [DebitCard] = []
    var userStates : UserState = .countOfJobs
    var state:String = "countOfJobs"
    var countJobs:Int = 1
    var countCards: Int = 1
    private var datePicker : UIDatePicker?
    
    
//    private var dictForUsersDefault = [String: Any?]()
//
//    deinit {
//        dictForUsersDefault.removeAll()
//    }
//
//    //MARK: - Protocol Methods -
//    func theObject(forKey key: String) -> Any? {
//        if let object = dictForUsersDefault[key] {
//            return object
//        }
//        return nil
//    }
//
//    func setTheObject(_ object: Any, forKey key: String) {
//        dictForUsersDefault[key] = object
//    }
//
//    func removeTheObject(forKey key: String) {
//        dictForUsersDefault.removeValue(forKey: key)
//    }
//
//    func synchronizeAll() {
//        //none
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cirlceButton.layer.cornerRadius = 20
        circleView.layer.cornerRadius = 20
        
        firstQuestionTextOutlet.text = "How many jobs do you have?"
        firstTextFieldOutlet.isHidden = false
        
        datePicker = UIDatePicker()
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ChangeExtraSpentViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChangeExtraSpentViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        thirdTextFieldOutlet.inputView = datePicker
        datePicker?.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        thirdTextFieldOutlet.inputAccessoryView = toolbar
        //new
    }
    
    
    @objc func donePressed() {
        
        let forrmater = DateFormatter()
        forrmater.dateStyle = .medium
        forrmater.timeStyle = .none
        forrmater.dateFormat = "MM/dd/yyyy"
        thirdTextFieldOutlet.text = forrmater.string(from: datePicker!.date)
        self.view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "MM/dd/yyyy"
        thirdTextFieldOutlet.text = dateForrmater.string(from: datePicker.date)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        
        if state == "countOfJobs" {
            if firstTextFieldOutlet.text != "" {
                print("countOfJobs")
                defaults.set(firstTextFieldOutlet.text, forKey: "CountOfJobs")
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
                defaults.set(firstTextFieldOutlet.text, forKey: "CompanyName")
                defaults.synchronize()
                jobInfo.name = firstTextFieldOutlet.text!
                print(firstTextFieldOutlet.text as Any)
                
                
                firstTextFieldOutlet.text = ""
                firstQuestionTextOutlet.text = "What your mounthly salary at \(String(describing: UserDefaults.standard.object(forKey: "CompanyName") as! String)) job?"
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
                defaults.set(firstTextFieldOutlet.text, forKey: "CountOfDebitCards")
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
            
            
        } else if ((state == "nameOfDebitCard") && (countCards <= userInfo.countOfDebitCards)) {
            if firstTextFieldOutlet.text != "" {
                print("NameOfDebitCard")
                if let name = firstTextFieldOutlet.text {
                    defaults.set(name, forKey: "NameOfDebitCard")
                    defaults.synchronize()
                    debitCardInfo.debitCardName = name
                    print(name as Any)
                }
                //                usersArray.append(defaults)
                
                firstTextFieldOutlet.text = ""
                firstQuestionTextOutlet.text = "How much money do you have on \(String(describing: UserDefaults.standard.object(forKey: "NameOfDebitCard") as! String)) debit card?"
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
                defaults.set(Double(firstTextFieldOutlet.text!), forKey: "MoneyOnDebitcard")
                defaults.synchronize()
                debitCardInfo.debitCardAmountOfMoney = Int(firstTextFieldOutlet.text!)!
                print(firstTextFieldOutlet.text as Any)
                //                usersArray.append(defaults)
                //NEW
                userInfo.debitCard.append(debitCardInfo)
                //NEW
                masOfUserInfo.append(userInfo)
                firstTextFieldOutlet.text = ""
                if (countCards <= userInfo.countOfDebitCards) {
                    firstQuestionTextOutlet.text = "Name of debit card?"
                    state = "nameOfDebitCard"
                } else {
                    state = "mounthlySpent"
                    firstQuestionTextOutlet.text = "What your mounthly spent?"
                    secondTextFieldOutlet.isHidden = false
                    thirdTextFieldOutlet.isHidden = false
                    
                    firstTextFieldOutlet.placeholder = "Name"
                    secondTextFieldOutlet.placeholder = "Price"
                    thirdTextFieldOutlet.placeholder = "Date of your last payment for this spent"
                    addMoreMounthlySpentOutlet.isHidden = false
                    circleImageOutlet.image = UIImage.init(named: "downloadCirculeSeven")
                    
                }
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
                
                mounthlySpent.mounthlySpentName = firstTextFieldOutlet.text!
                mounthlySpent.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
                mounthlySpent.mounthlySpentDate = datePicker!.date
                
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
            printAll()
            userInfo.job.append(jobInfo)
            userInfo.debitCard.append(debitCardInfo)
            userInfo.mounthlySpent.append(mounthlySpent)
            
            masOfUserInfo.append(userInfo)
            
            let encoderForUsers = JSONEncoder()
            if let encoded = try? encoderForUsers.encode(masOfUserInfo) {
                defaults.set(encoded, forKey: "UserInfoArray")
                defaults.synchronize()
            }
            
            masOfDebitCards.append(debitCardInfo)
            
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
            
            mounthlySpent.mounthlySpentName = firstTextFieldOutlet.text!
            mounthlySpent.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
            mounthlySpent.mounthlySpentDate = datePicker!.date
            
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
        print("countOfJobs - \(defaults.integer(forKey: "CountOfJobs") as Any)")
        print("companyName - \(defaults.string(forKey: "CompanyName") as Any)")
        print("mounthlySalary - \(defaults.integer(forKey: "mounthlySalary") as Any)")
        print("countOfDebitCards - \(defaults.integer(forKey: "CountOfDebitCards") as Any)")
        print("nameOfDebitCard - \(defaults.value(forKey: "NameOfDebitCard") as Any)")
        print("moneyOnDebitcard - \(defaults.value(forKey: "MoneyOnDebitcard") as Any)")
        print("mounthlySpent - \(defaults.integer(forKey: "MounthlySpent") as Any)")
    }
    
    
    
}
