//
//  UserDefaults.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 11/3/20.
//

import Foundation

protocol UserDefaultsProtocol: class {
    func theObject(forKey key: String) -> Any?
    func setTheObject(_ object: Any, forKey key: String)
    func removeTheObject(forKey key: String)
    func synchronizeAll()
}

class UserDefaultsController: NSObject {
    static let shared = UserDefaultsController()
    var delegate: UserDefaultsProtocol?
    
    override init() {
        super.init()
        //default delegate
        delegate = UserDefaults.standard
    }
    
    func object(forKey key: String) -> Any? {
        return delegate?.theObject(forKey: key)
    }
    
    func set(_ value: Any, forKey key: String) {
        delegate?.setTheObject(value, forKey: key)
    }
    
    func removeObject(forKey key: String) {
        delegate?.removeTheObject(forKey: key)
    }
    
    func synchronize() {
        delegate?.synchronizeAll()
    }
}

extension UserDefaults: UserDefaultsProtocol {
    
    func theObject(forKey key: String) -> Any? {
        return self.object(forKey: key)
    }
    
    func setTheObject(_ object: Any, forKey key: String) {
        self.set(object, forKey: key)
    }
    
    func removeTheObject(forKey key: String) {
        self.removeObject(forKey: key)
    }
    
    func synchronizeAll() {
        self.synchronize()
    }
}

//Example how to use
//UserDefaultsController.shared.set("test.com", forKey: “DomainNameKey”)

