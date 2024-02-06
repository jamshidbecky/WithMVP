//
//  Ex+UIStackView.swift
//  IpakYuliBank
//
//  Created by locky on 17/01/24.
//

import UIKit


extension UIStackView {
    
    
    class func getStack(axis: NSLayoutConstraint.Axis, distribution: Distribution, align: Alignment, spacing: CGFloat ) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.distribution = distribution
        stack.alignment = align
        stack.spacing = spacing
        return stack
    }
}
