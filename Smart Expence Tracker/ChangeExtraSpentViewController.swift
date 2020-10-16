//
//  ChangeExtraSpentViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/29/20.
//

import UIKit

class ChangeExtraSpentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    private var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Name", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        priceTextField.attributedPlaceholder = NSAttributedString(string:"Price", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        dateTextField.attributedPlaceholder = NSAttributedString(string:"Date", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        saveButtonOutlet.layer.cornerRadius = 20
        
     
        datePicker = UIDatePicker()
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ChangeExtraSpentViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChangeExtraSpentViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        dateTextField.inputView = datePicker
        datePicker?.datePickerMode = .date
        
        //NEW
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolbar
    }
    //NEW
    @objc func donePressed() {
        
        let forrmater = DateFormatter()
        forrmater.dateStyle = .medium
        forrmater.timeStyle = .none
        forrmater.dateFormat = "MM/dd/yyyy"
        dateTextField.text = forrmater.string(from: datePicker!.date)
        self.view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "MM/dd/yyyy"
        dateTextField.text = dateForrmater.string(from: datePicker.date)
    }

}
