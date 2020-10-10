//
//  MainTabBarController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 10/4/20.
//

import UIKit
//protocol ChangeTypesInSelectedVCDelegate {
//    func changeType(type:SetingsType)
//}

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
//    var changeTypeDelegate : ChangeTypesInSelectedVCDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    
    
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Selected item")
//        let index = tabBar.selectedItem
//
        
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let index = tabBarController.selectedIndex
//        if index == 1 {
//            print("open ExtraSpent")
//            changeTypeDelegate.changeType(type: .extraSpent)
//        } else if index == 2 {
//            changeTypeDelegate.changeType(type: .planList)
//        }
    }
}
