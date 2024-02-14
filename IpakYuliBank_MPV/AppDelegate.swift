//
//  AppDelegate.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarVC()
        window?.makeKeyAndVisible()
        
        return true
    }

}

