//
//  TransactionHistoryHeader.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class TransactionHistoryHeader: UICollectionReusableView {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 0)
    }()
    
    private lazy var titleHeader: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Amaliyotlar tarixi"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Barchasi", for: .normal)
        btn.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI(){
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7).isActive = true
        
        mainStack.addArrangedSubview(titleHeader)
        mainStack.addArrangedSubview(btn)
    }
    
}

