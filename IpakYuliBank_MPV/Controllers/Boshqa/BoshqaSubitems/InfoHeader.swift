//
//  NoHeader.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class InfoHeader: UICollectionReusableView {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 0)
    }()
    
    private lazy var titleHeader: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 21)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Qo'shimcha ma'lumot"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI(){
        backgroundColor = .clear
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        mainStack.addArrangedSubview(titleHeader)
    }
    
}
