//
//  BankServiceHeader.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

final class BankServiceHeader: UICollectionReusableView {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 20)
    }()
    
    private lazy var titleHeader: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        lbl.textColor = .black.withAlphaComponent(0.8)
        lbl.textAlignment = .left
        lbl.text = "Bank xizmatlari"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sozlash", for: .normal)
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
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        mainStack.addArrangedSubview(titleHeader)
        mainStack.addArrangedSubview(btn)
    }
    
}
