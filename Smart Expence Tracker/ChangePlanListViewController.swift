//
//  ChangePlanListViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/29/20.
//

import UIKit

class ChangePlanListViewController: UIViewController {

    @IBOutlet weak var titleOutlet: UITextField!
    @IBOutlet weak var priceOutlet: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleOutlet.attributedPlaceholder = NSAttributedString(string:"Name", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        priceOutlet.attributedPlaceholder = NSAttributedString(string:"Price", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        saveButtonOutlet.layer.cornerRadius = 20
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
