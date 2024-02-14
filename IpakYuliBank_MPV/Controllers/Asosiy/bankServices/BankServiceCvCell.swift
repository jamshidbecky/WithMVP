//
//  BankServiceCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

final class BankServiceCvCell: TouchableCVCell {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fillEqually, align: .center, spacing: 2)
    }()
    
    private lazy var shadowView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var topView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "play.house")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        return img
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = "Mening uyim"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell(){
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 1.4
        shadowView.backgroundColor = .white
        contentView.addSubview(shadowView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1.2).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1.2).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1.2).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1.2).isActive = true
        shadowView.layer.cornerRadius = 7
        
        shadowView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -10).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(topView)
        mainStack.addArrangedSubview(titleLbl)
        
        topView.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0).isActive = true
        img.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        img.heightAnchor.constraint(equalTo: img.widthAnchor, multiplier: 1.0).isActive = true
        img.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
    }
    
    func prepare(dm: BankServiceDM){
        titleLbl.text = dm.title
        img.image = UIImage(systemName: dm.imgName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
