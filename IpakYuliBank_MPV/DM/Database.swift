//
//  Database.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 03/03/2024.
//

import Foundation
import UIKit

class Database {
    static let shared = Database()
    
    func saveString(_ key: String, _ value: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func getString(_ key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
}




class View1: UIView {
    
    init() {
        super.init(frame: .zero)
        Database.shared.saveString(Keys.password, "Khaydarov!21")
        
        
        if Database.shared.getString(Keys.password).isEmpty {
            print("ok")
        } else {
            print("vuu")
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
