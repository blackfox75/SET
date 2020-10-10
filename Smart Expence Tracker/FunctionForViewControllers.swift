//
//  FunctionForViewControllers.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 9/19/20.
//

import UIKit

extension UIViewController {
 
    static func getFromStoryboard(withId id: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: id)
        return controller
    }
    
}
