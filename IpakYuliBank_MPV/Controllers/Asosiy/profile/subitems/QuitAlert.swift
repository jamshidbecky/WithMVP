//
//  QuitAlert.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/03/2024.
//

import UIKit

protocol QuitAlertProtocol: AnyObject {
    func didNoButtonTapped()
}

final class QuitAlert: UIView {
    
    var delegate: QuitAlertProtocol?
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 15)
    }()
    
    private lazy var topStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .center, spacing: 20)
    }()
    
    private lazy var buttonStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fillEqually, align: .fill, spacing: 10)
    }()
    
    private lazy var alertView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        v.layer.cornerRadius = 8
        return v
    }()
    
    private lazy var alertViewHaveBorder: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        v.layer.cornerRadius = 8 
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 0.5
        return v
    }()
    
    private lazy var alertImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "iym__logo")
        iv.tintColor = .white
        iv.backgroundColor = UIColor(named: "mainColor")
        iv.layer.cornerRadius = 15
        iv.contentMode = .center
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var alertTitle: UILabel = {
        let label = UILabel()
        label.text = "Chiqish"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var yesButton: UIButton = {
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Ha", for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        b.setTitleColor(.systemRed, for: .normal)
        b.layer.cornerRadius = 8
        b.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        return b
    }()
    
    private lazy var noButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Yo'q", for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        b.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        b.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black.withAlphaComponent(0.5)
        initUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(noButtonTapped))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(alertView)
        alertView.addSubview(alertViewHaveBorder)
        alertViewHaveBorder.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(buttonStack)
        
        topStack.addArrangedSubview(alertImage)
        topStack.addArrangedSubview(alertTitle)
        
        buttonStack.addArrangedSubview(yesButton)
        buttonStack.addArrangedSubview(noButton)
        
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: centerYAnchor),
            alertView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            alertView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            alertViewHaveBorder.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 2),
            alertViewHaveBorder.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -2),
            alertViewHaveBorder.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 2),
            alertViewHaveBorder.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -2),
            
            mainStack.leadingAnchor.constraint(equalTo: alertViewHaveBorder.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: alertViewHaveBorder.trailingAnchor, constant: -20),
            mainStack.topAnchor.constraint(equalTo: alertViewHaveBorder.topAnchor, constant: 20),
            mainStack.bottomAnchor.constraint(equalTo: alertViewHaveBorder.bottomAnchor, constant: -20),
            
            alertImage.widthAnchor.constraint(equalTo: topStack.widthAnchor, multiplier: 0.25),
            alertImage.heightAnchor.constraint(equalTo: topStack.widthAnchor, multiplier: 0.25),
            
            yesButton.heightAnchor.constraint(equalTo: alertImage.heightAnchor, multiplier: 0.6)
            
        ])
    }
    
    @objc private func noButtonTapped() {
        delegate?.didNoButtonTapped()
    }
}
