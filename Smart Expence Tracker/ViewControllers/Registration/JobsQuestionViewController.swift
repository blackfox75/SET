////
////  jbosQuestionViewController.swift
////  Smart Expence Tracker
////
////  Created by Robert Tratseuski on 9/21/20.
////
//
//import UIKit
//
//enum Questions {
//    case countOfjobs
//    case companyName
//    case mounthlySalary
//    case countOfDebitCards
//    case nameOfDebitCard
//    case moneyOnDebitcard
//    case mounthlySpent
//    case nextController
//}
//
//class JobsQuestionViewController: UIViewController { //, UserDefaultsProtocol {
//    @IBOutlet weak var firstQuestionTextOutlet: UILabel!
//    @IBOutlet weak var secondQuestionTextOutlet: UILabel!
//    @IBOutlet weak var firstTextFieldOutlet: UITextField!
//    @IBOutlet weak var secondTextFieldOutlet: UITextField!
//    @IBOutlet weak var thirdTextFieldOutlet: UITextField!
//    @IBOutlet weak var congratulationsMessageOutlet: UILabel!
//    @IBOutlet weak var circleImageOutlet: UIImageView!
//    @IBOutlet weak var buttonTextOutlet: UILabel!
//    @IBOutlet weak var circleView: UIView!
//    @IBOutlet weak var cirlceButton: UIButton!
//    @IBOutlet weak var errorLabelOutlet: UILabel!
//    @IBOutlet weak var addMoreMounthlySpentOutlet: UIButton!
//
//    let userInfo = User() // добавляю сюда
//    let debitCardInfo = DebitCard()
//    let mounthlySpent = MounthlySpent()
//    let jobInfo = Job()
//    var masOfUserInfo : [User] = [] // masOfUserInfo.Append.UserInfo 2. userDefaults add masOfUserDefaults
//    var masOfDebitCards: [DebitCard] = []
//    var userStates : UserState = .countOfJobs
//    var currentQuestion : Questions = .countOfjobs
//    var questionsList : [String] = ["How many jobs do you have?","What your company name?","What your mounthly salary at \(jobInfo.name) job?", "What your company name?", "Name of debit card?", "How much money do you have on \(debitCardInfo.debitCardName) debit card?", "What your mounthly spent?"]
//    var countJobs: Int = 1
//    var countCards: Int = 1
//
//
//    private var datePicker : UIDatePicker?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        cirlceButton.layer.cornerRadius = 20
//        circleView.layer.cornerRadius = 20
//
//        firstQuestionTextOutlet.text = "How many jobs do you have?"
//        firstTextFieldOutlet.isHidden = false
//
//        datePicker = UIDatePicker()
//        datePicker?.preferredDatePickerStyle = .wheels
//        datePicker?.datePickerMode = .date
//        datePicker?.addTarget(self, action: #selector(ChangeExtraSpentViewController.dateChanged(datePicker:)), for: .valueChanged)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChangeExtraSpentViewController.viewTapped(gestureRecognizer:)))
//        view.addGestureRecognizer(tapGesture)
//        thirdTextFieldOutlet.inputView = datePicker
//        datePicker?.datePickerMode = .date
//
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//        toolbar.setItems([doneBtn], animated: true)
//        thirdTextFieldOutlet.inputAccessoryView = toolbar
//
//    }
//
//
//    @objc func donePressed() {
//
//        let forrmater = DateFormatter()
//        forrmater.dateStyle = .medium
//        forrmater.timeStyle = .none
//        forrmater.dateFormat = "MM/dd/yyyy"
//        thirdTextFieldOutlet.text = forrmater.string(from: datePicker!.date)
//        self.view.endEditing(true)
//    }
//
//    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
//        view.endEditing(true)
//    }
//
//    @objc func dateChanged(datePicker: UIDatePicker) {
//        let dateForrmater = DateFormatter()
//        dateForrmater.dateFormat = "MM/dd/yyyy"
//        thirdTextFieldOutlet.text = dateForrmater.string(from: datePicker.date)
//    }
//
//    @IBAction func nextButtonClicked(_ sender: Any) {
//
////        if state == "countOfJobs" {
////            if firstTextFieldOutlet.text != "" {
////                userInfo.countOfJobs = Int(firstTextFieldOutlet.text!)!
////                firstTextFieldOutlet.text = ""
////                print("CountOfJobs", userInfo.countOfJobs)
////                userStates = UserState.companyName
////                //Commit
////                state = "companyName"
////                firstQuestionTextOutlet.text = "What your company name?"
////                errorLabelOutlet.isHidden = true
////                circleImageOutlet.image = UIImage.init(named: "downloadCirculeTwo")
////            } else {
////                errorLabelOutlet.isHidden = false
////                errorLabelOutlet.text = "Please fill out information about count of your jobs"
////            }
////        } else if ((state == "companyName") && (countJobs <= userInfo.countOfJobs)) {
////            if firstTextFieldOutlet.text != "" {
////                jobInfo.name = firstTextFieldOutlet.text!
////                print("companyName", jobInfo.name)
////                firstTextFieldOutlet.text = ""
////                firstQuestionTextOutlet.text = "What your mounthly salary at \(jobInfo.name) job?"
////                userStates = UserState.mounhtlySalary
////                state = "mounthlySalary"
////                countJobs += 1
////                errorLabelOutlet.isHidden = true
////                circleImageOutlet.image = UIImage.init(named: "downloadCirculeThree")
////            } else {
////                errorLabelOutlet.isHidden = false
////                errorLabelOutlet.text = "Please fill out information about your company"
////            }
////        } else if state == "mounthlySalary" {
////            if firstTextFieldOutlet.text != "" {
////                jobInfo.salary = Int(firstTextFieldOutlet.text!)!
////
////                print("mounthlySalary", jobInfo.salary)
////
////                firstTextFieldOutlet.text = ""
////                if (countJobs <= userInfo.countOfJobs) {
////                    firstQuestionTextOutlet.text = "What your company name?"
////                    state = "companyName"
////                } else {
////                    state = "countOfDebitCards"
////                    //new
////                    userInfo.job.append(jobInfo)
////                    //new
////                    firstQuestionTextOutlet.text = "How many debit cards do you have?"
////                    circleImageOutlet.image = UIImage.init(named: "downloadCirculeFour")
////                }
////                errorLabelOutlet.isHidden = true
////
////            } else {
////                errorLabelOutlet.isHidden = false
////                errorLabelOutlet.text = "Please fill out information about your mounthly salary"
////            }
////
////
////        } else if state == "countOfDebitCards" {
////            if firstTextFieldOutlet.text != "" {
////                userInfo.countOfDebitCards = Int(firstTextFieldOutlet.text!)!
////                print("countOfDebitCards",userInfo.countOfDebitCards)
////
////                firstTextFieldOutlet.text = ""
////                userStates = UserState.nameOfDebitCard
////                state = "nameOfDebitCard"
////                firstQuestionTextOutlet.text = "Name of debit card?"
////                errorLabelOutlet.isHidden = true
////                circleImageOutlet.image = UIImage.init(named: "downloadCirculeFive")
////            } else {
////                errorLabelOutlet.isHidden = false
////                errorLabelOutlet.text = "Please fill out information about count of your debit cards"
////            }
////
////
////        } else if ((state == "nameOfDebitCard") && (countCards <= userInfo.countOfDebitCards)) {
////
////                if firstTextFieldOutlet.text != "" {
////                    if let name = firstTextFieldOutlet.text {
////                        debitCardInfo.debitCardName = name
////
////                        print("nameOfDebitCard",debitCardInfo.debitCardName)
////                    }
////
////                    firstTextFieldOutlet.text = ""
////                    firstQuestionTextOutlet.text = "How much money do you have on \(debitCardInfo.debitCardName) debit card?"
////                    userStates = UserState.moneyOnDebitcard
////                    state = "moneyOnDebitcard"
////                    countCards += 1
////                    errorLabelOutlet.isHidden = true
////                    circleImageOutlet.image = UIImage.init(named: "downloadCirculeSix")
////                } else {
////                    errorLabelOutlet.isHidden = false
////                    errorLabelOutlet.text = "Please fill out information about debit card"
////                }
////
////        } else if state == "moneyOnDebitcard" {
////
////                if firstTextFieldOutlet.text != "" {
////                    debitCardInfo.debitCardAmountOfMoney = Int(firstTextFieldOutlet.text!)!
////                    print("moneyOnDebitcard", debitCardInfo.debitCardAmountOfMoney)
////                    masOfDebitCards.append(debitCardInfo)
//////                    masOfDebitCards[index].debitCardName = debitCardInfo.debitCardName
//////                    masOfDebitCards[index].debitCardAmountOfMoney = debitCardInfo.debitCardAmountOfMoney
////
////                    firstTextFieldOutlet.text = ""
////                    if (countCards <= userInfo.countOfDebitCards) {
////                        firstQuestionTextOutlet.text = "Name of debit card?"
////                        state = "nameOfDebitCard"
////                    } else {
////                        state = "mounthlySpent"
////                        firstQuestionTextOutlet.text = "What your mounthly spent?"
////                        secondTextFieldOutlet.isHidden = false
////                        thirdTextFieldOutlet.isHidden = false
////
////                        firstTextFieldOutlet.placeholder = "Name"
////                        secondTextFieldOutlet.placeholder = "Price"
////                        thirdTextFieldOutlet.placeholder = "Date of your last payment for this spent"
////                        addMoreMounthlySpentOutlet.isHidden = false
////                        circleImageOutlet.image = UIImage.init(named: "downloadCirculeSeven")
////
////                    }
////                } else {
////                    errorLabelOutlet.isHidden = false
////                    errorLabelOutlet.text = "Please fill out information about your money on debit card"
////                }
////
////        } else if state == "mounthlySpent" {
////            if (firstTextFieldOutlet.text != "" && secondTextFieldOutlet.text != "" && thirdTextFieldOutlet.text != "") {
////                print("MounthlySpentName")
////
////                mounthlySpent.mounthlySpentName = firstTextFieldOutlet.text!
////                mounthlySpent.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
////                mounthlySpent.mounthlySpentDate = datePicker!.date
////
////                print("MPName", mounthlySpent.mounthlySpentName as Any)
////                print("MPSum", mounthlySpent.mounthlySpentSum as Any)
////                print("MPDate", mounthlySpent.mounthlySpentDate as Any)
////
////                userInfo.mounthlySpent.append(mounthlySpent)
////
////                congratulationsMessageOutlet.isHidden = false
////                firstQuestionTextOutlet.isHidden = true
////                firstTextFieldOutlet.isHidden = true
////                secondTextFieldOutlet.isHidden = true
////                thirdTextFieldOutlet.isHidden = true
////
////                errorLabelOutlet.isHidden = true
////                addMoreMounthlySpentOutlet.isHidden = true
////                circleImageOutlet.image = UIImage.init(named: "DoneCircule")
////                cirlceButton.setTitle("Done", for: .normal)
////
////
////                state = "nextController"
////            } else {
////                errorLabelOutlet.isHidden = false
////                errorLabelOutlet.text = "Please fill out all information about your mounthly spent"
////            }
////        } else if state == "nextController" {
////            //            printAll()
////
////            userInfo.debitCard.append(debitCardInfo)
////            userInfo.job.append(jobInfo)
////            userInfo.mounthlySpent.append(mounthlySpent)
////            masOfUserInfo.append(userInfo)
////
////            for index in masOfUserInfo {
////                print("count",index.countOfDebitCards)
////            }
////
////            let encoderForUsers = JSONEncoder()
////            if let encoded = try? encoderForUsers.encode(userInfo) {
////                UserDefaults.standard.setValue(encoded, forKey: "UserInfoArray")
////            }
////
////
////
////
//////            let mainVC = UIViewController.getFromStoryboard(withId: "MainTabBarController") as! MainTabBarController
//////            navigationController?.pushViewController(mainVC, animated: true)
////
////            let mainVC = UIViewController.getFromStoryboard(withId: "MainViewController") as! MainViewController
////            navigationController?.pushViewController(mainVC, animated: true)
////
////            //new
////            let controller = mainVC as? MainViewController
////            controller?.info = self
////            //new
////        } else {
////            print("Error")
////        }
//    }
//
//
//    @IBAction func addMoreMounthlySpent(_ sender: Any) {
////        state = "mounthlySpent"
//
//        if (firstTextFieldOutlet.text != "" && secondTextFieldOutlet.text != "" && thirdTextFieldOutlet.text != "") {
//            print("MounthlySpent")
//            UserDefaults.standard.setValue(firstTextFieldOutlet.text, forKey: "MounthlySpentName")
//            UserDefaults.standard.synchronize()
//            UserDefaults.standard.setValue(secondTextFieldOutlet.text, forKey: "MounthlySpentSum")
//            UserDefaults.standard.synchronize()
//            UserDefaults.standard.setValue(thirdTextFieldOutlet.text, forKey: "MounthlySpentDate")
//            UserDefaults.standard.synchronize()
//
//            mounthlySpent.mounthlySpentName = firstTextFieldOutlet.text!
//            mounthlySpent.mounthlySpentSum = Int(secondTextFieldOutlet.text!)!
//            mounthlySpent.mounthlySpentDate = datePicker!.date
//
//            print("MPName", mounthlySpent.mounthlySpentName as Any)
//            print("MPSum", mounthlySpent.mounthlySpentSum as Any)
//            print("MPDate", mounthlySpent.mounthlySpentDate as Any)
//
//            firstTextFieldOutlet.text = ""
//            secondTextFieldOutlet.text = ""
//            thirdTextFieldOutlet.text = ""
//
//            errorLabelOutlet.isHidden = true
//        } else {
//            errorLabelOutlet.isHidden = false
//            errorLabelOutlet.text = "Please fill out all information about your mounthly spent"
//        }
//
//    }
//
//
//    func printAll() {
//        print("countOfJobs - \(UserDefaults.standard.integer(forKey: "CountOfJobs") as Any)")
//        print("companyName - \(UserDefaults.standard.string(forKey: "CompanyName") as Any)")
//        print("mounthlySalary - \(UserDefaults.standard.integer(forKey: "mounthlySalary") as Any)")
//        print("countOfDebitCards - \(UserDefaults.standard.integer(forKey: "CountOfDebitCards") as Any)")
//        print("nameOfDebitCard - \(UserDefaults.standard.value(forKey: "NameOfDebitCard") as Any)")
//        print("moneyOnDebitcard - \(UserDefaults.standard.value(forKey: "MoneyOnDebitcard") as Any)")
//        print("mounthlySpent - \(UserDefaults.standard.integer(forKey: "MounthlySpent") as Any)")
//    }
//
//
//
//}



import UIKit
enum Questions {
    case countOfjobs
    case companyName
    case mounthlySalary
    case countOfDebitCards
    case nameOfDebitCard
    case moneyOnDebitcard
    case mounthlySpent
    case nextController
}

class JobsQuestionViewController: UIViewController {
    // MARK: - Properties
    private var userInfo = User() {
            didSet {
                print(userInfo)
            }
        }
    
    private var masOfUserInfo : [User] = [] // masOfUserInfo.Append.UserInfo 2. userDefaults add masOfUserDefaults
    private var userStates : UserState = .countOfJobs
    private var jobNameUpdate : String = ""
    lazy private var questionList: [String] = ["How many jobs do you have?","What your company name?","What your mounthly salary at lol job?", "How much debit cards do you have?", "Name of debit card?", "How much money do you have on lol debit card?", "What your mounthly spent?"]
    private var questionNum: Int = 0 {
        didSet {
            if questionNum < questionList.count {
                firstQuestionTextOutlet.text = questionList[questionNum]
            }
            switch questionNum {
            case 1:
                userStates = .countOfJobs
            case 2:
                userStates = .companyName
            case 3:
                userStates = .mounhtlySalary
            case 4:
                userStates = .countOfDebitCards
            case 5:
                userStates = .nameOfDebitCard
            case 6:
                userStates = .moneyOnDebitcard
            case 7:
                userStates = .mounthlySpent
                
            default:
                break
            }
            
            updateUI()
        }
    }
    private var currentQuestion: Questions = .countOfjobs {
        didSet {
            updateUI()
        }
    }
    private var datePicker : UIDatePicker?
    
    // MARK: - Outlets
    @IBOutlet weak var firstQuestionTextOutlet: UILabel!
    @IBOutlet weak var secondQuestionTextOutlet: UILabel!
    @IBOutlet weak var firstTextFieldOutlet: UITextField!
    @IBOutlet weak var secondTextFieldOutlet: UITextField!
    @IBOutlet weak var thirdTextFieldOutlet: UITextField!
    @IBOutlet weak var congratulationsMessageOutlet: UILabel!
    @IBOutlet weak var circleImageOutlet: UIImageView!
    @IBOutlet weak var buttonTextOutlet: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var cirlceButton: UIButton! {
        didSet {
            cirlceButton.layer.cornerRadius = 20
            circleView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var errorLabelOutlet: UILabel!
    @IBOutlet weak var addMoreMounthlySpentOutlet: UIButton!
    
    
    // MARK: - Actions
    @IBAction func nextButtonClicked(_ sender: Any) {
        questionNum += 1
        firstTextFieldOutlet.text = ""
    }
    
    
    @IBAction func addMoreMounthlySpent(_ sender: Any) {
        
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        setupNavigationBar()
        
        questionNum = 0
    }
    
    
    
    // MARK: - Function
    func setupNavigationBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        thirdTextFieldOutlet.inputAccessoryView = toolbar
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ChangeExtraSpentViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChangeExtraSpentViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        thirdTextFieldOutlet.inputView = datePicker
        datePicker?.datePickerMode = .date
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
    
    func updateUI() {
            switch currentQuestion {
            case .countOfjobs:
                userInfo.countOfJobs = Int(firstTextFieldOutlet.text ?? "1") ?? 1
            case .companyName:
                userInfo.job[0].name = firstTextFieldOutlet.text!
            case .mounthlySalary:
                userInfo.job[0].salary = Int(firstTextFieldOutlet.text ?? "0")!
                questionList[questionNum].append("What your mounthly salary at \(userInfo.job[0].name) job?")
            case .countOfDebitCards:
                userInfo.countOfDebitCards = Int(firstTextFieldOutlet.text ?? "0")!
            case .nameOfDebitCard:
                userInfo.debitCard[0].debitCardName = firstTextFieldOutlet.text!
            case .moneyOnDebitcard:
                userInfo.debitCard[0].debitCardAmountOfMoney = Int(firstTextFieldOutlet.text ?? "0")!
            case .mounthlySpent:
                userInfo.mounthlySpent[0].mounthlySpentName = firstTextFieldOutlet.text!
                userInfo.mounthlySpent[0].mounthlySpentSum = Int(secondTextFieldOutlet.text ?? "0")!
//                userInfo.mounthlySpent[0].mounthlySpentDate = Date(from: thirdTextFieldOutlet.text ?? NSDate)
            case .nextController:
                break
            }
        print(userInfo)
        }
    
    func printAll() {
        print("countOfJobs - \(UserDefaults.standard.integer(forKey: "CountOfJobs") as Any)")
        print("companyName - \(UserDefaults.standard.string(forKey: "CompanyName") as Any)")
        print("mounthlySalary - \(UserDefaults.standard.integer(forKey: "mounthlySalary") as Any)")
        print("countOfDebitCards - \(UserDefaults.standard.integer(forKey: "CountOfDebitCards") as Any)")
        print("nameOfDebitCard - \(UserDefaults.standard.value(forKey: "NameOfDebitCard") as Any)")
        print("moneyOnDebitcard - \(UserDefaults.standard.value(forKey: "MoneyOnDebitcard") as Any)")
        print("mounthlySpent - \(UserDefaults.standard.integer(forKey: "MounthlySpent") as Any)")
    }
    
    // MARK: - Network Manager calls
    
    
}
