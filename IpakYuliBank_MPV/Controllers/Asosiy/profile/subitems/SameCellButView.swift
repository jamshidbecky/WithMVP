//
//  SameCellButView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit

final class SameCellButView: UIView {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var leftStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var cellImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1).isActive = true
        return img
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Shaxsan bana"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var chevronImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.forward")
        img.contentMode = .scaleAspectFit
        img.tintColor = .gray
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1).isActive = true
        return img
    }()
    
    init(imgName: String, title: String) {
        super.init(frame: .zero)
        cellImg.image = UIImage(systemName: imgName)
        titleLbl.text = title
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18).isActive = true
        
        mainStack.addArrangedSubview(leftStack)
        mainStack.addArrangedSubview(chevronImg)
        
        leftStack.addArrangedSubview(cellImg)
        leftStack.addArrangedSubview(titleLbl)
        
    }
}
