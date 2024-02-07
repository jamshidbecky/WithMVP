//
//  TabBarVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }
    
    private func customInit() {
        let mainVC = UINavigationController(rootViewController: AsosiyVC())
        mainVC.tabBarItem.title = "Asosiy"
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        
        let servicesVC = UINavigationController(rootViewController: ServicesVC())
        servicesVC.tabBarItem.title = "Xizmatlar"
        servicesVC.tabBarItem.image = UIImage(systemName: "square.stack.3d.up")
        
        let paymentsVC = UINavigationController(rootViewController: PaymentVC())
        paymentsVC.tabBarItem.title = "To'lovlar"
        paymentsVC.tabBarItem.image = UIImage(systemName: "creditcard.and.123")
        
        let exchangeVC = UINavigationController(rootViewController: AyirboshlashVC())
        exchangeVC.tabBarItem.title = "Ayirboshlash"
        exchangeVC.tabBarItem.image = UIImage(systemName: "link.circle")
        
        let otherVC = UINavigationController(rootViewController: OtherVC())
        otherVC.tabBarItem.title = "Boshqa"
        otherVC.tabBarItem.image = UIImage(systemName: "mail.stack")
        
        viewControllers = [mainVC, servicesVC, paymentsVC, exchangeVC, otherVC]
        selectedIndex = 0
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.init(named: "systemGray5")?.cgColor
        tabBar.unselectedItemTintColor = UIColor.systemGray
        
        UITabBar.appearance().tintColor = UIColor(named: "mainColor")
    }
    
}
