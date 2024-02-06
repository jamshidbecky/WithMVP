//
//  IdentificationView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit

final class IdentificationView: UIView, UIGestureRecognizerDelegate {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 15)
    }()
    
    private lazy var middleStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var byMobileStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var byBankStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var bottomStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 10)
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Ilovamizda yanada ko'proq imkoniyatga ega bo'ling"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var typeIdentificationLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Identifikatsiyadan o'tishning ikki yo'li mavjud"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var byMobileImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "checkmark.circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1).isActive = true
        return img
    }()
    
    private lazy var byMobileLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Ipak Yo'li Mobileda masofadan"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var byBankImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "checkmark.circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor, multiplier: 1).isActive = true
        return img
    }()
    
    private lazy var byBankLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Shaxsan bank filialiga tashrif buyurgan holda"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var identificationLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.textColor = UIColor(named: "mainColor")
        lbl.textAlignment = .left
        lbl.text = "Identifikatsiyadan o'tish"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var identificationImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.right")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "mainColor")?.cgColor
        
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        mainStack.addArrangedSubview(titleLbl)
        mainStack.addArrangedSubview(middleStack)
        mainStack.addArrangedSubview(bottomStack)
        
        middleStack.addArrangedSubview(typeIdentificationLbl)
        middleStack.addArrangedSubview(byMobileStack)
        middleStack.addArrangedSubview(byBankStack)
        
        byMobileStack.addArrangedSubview(byMobileImg)
        byMobileStack.addArrangedSubview(byMobileLbl)
        
        byBankStack.addArrangedSubview(byBankImg)
        byBankStack.addArrangedSubview(byBankLbl)
        
        bottomStack.addArrangedSubview(identificationLbl)
        bottomStack.addArrangedSubview(identificationImg)
    }
}
