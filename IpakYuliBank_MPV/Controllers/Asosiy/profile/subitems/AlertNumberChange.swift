//
//  AlertNumberChange.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 02/03/2024.
//

import UIKit

protocol AlertNumberChangeProtocol {
    func didTappedXButton()
}

final class AlertNumberChange: UIView {
    
    var delegate: AlertNumberChangeProtocol?
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 30)
    }()
    
    private lazy var topStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 20)
    }()
    
    private lazy var bottomStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 16)
    }()
    
    private lazy var alertView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        return v
    }()
    
    private lazy var alertTitle: UILabel = {
        let label = UILabel()
        label.text = "выберuте страну"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var xButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(systemName: "xmark"), for: .normal)
        b.tintColor = .black
        return b
    }()
    
    private lazy var countryFlagImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "flag")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var numberCode: UILabel = {
        let label = UILabel()
        label.text = "O'zbekiston (+998)"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black.withAlphaComponent(0.5)
        initUI()
        xButton.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        
        addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        alertView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        alertView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        alertView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 15).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -15).isActive = true
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(bottomStack)
        
        topStack.addArrangedSubview(alertTitle)
        topStack.addArrangedSubview(xButton)
        
        bottomStack.addArrangedSubview(countryFlagImage)
        
        countryFlagImage.translatesAutoresizingMaskIntoConstraints = false
        countryFlagImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countryFlagImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bottomStack.addArrangedSubview(numberCode)
        
        bottomStack.isLayoutMarginsRelativeArrangement = true
        bottomStack.layoutMargins = .init(top: 6, left: 10, bottom: 6, right: 10)
        bottomStack.layer.masksToBounds = false
        bottomStack.layer.shadowColor = UIColor.systemGray3.cgColor
        bottomStack.layer.shadowOpacity = 0.5
        bottomStack.layer.shadowOffset = CGSize(width: 2, height: 2)
        bottomStack.layer.shadowRadius = 2
        bottomStack.layer.shouldRasterize = true
        bottomStack.layer.rasterizationScale = UIScreen.main.scale
    }
    
    @objc private func xButtonPressed() {
        delegate?.didTappedXButton()
    }
}
