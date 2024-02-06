//
//  Color.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
}
