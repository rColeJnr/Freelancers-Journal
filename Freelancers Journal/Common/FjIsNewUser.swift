//
//  FjCore.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 29/08/24.
//

import Foundation

/// Use UserDefaults to store in preferences whether this is first run
class FjIsNewUser {
    static let shared = FjIsNewUser()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setNotIsNewUSer() {
        UserDefaults.standard.setValue(true, forKey: "isNewUser")
    }
}
