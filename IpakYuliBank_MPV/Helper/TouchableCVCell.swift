//
//  TouchableCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 08/02/24.
//

import UIKit

class TouchableCVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                contentView.backgroundColor = .lightGray
            } else {
                contentView.backgroundColor = .white
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
