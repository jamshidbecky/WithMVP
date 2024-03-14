//
//  ChangePhoneNumber.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 02/03/2024.
//

import UIKit

final class ChangePhoneNumberVC: UIViewController {
    
    private lazy var mainStack: UIStackView = {
        .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 20)
    }()
    
    private lazy var topStack: UIStackView = {
        .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var fieldsStack: UIStackView = {
        .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var selectCountryStack: UIStackView = {
        .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 4)
    }()
    
    private lazy var yourNumber: UILabel = {
        let label = UILabel()
        label.text = "Sizning telefon raqamingiz"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    private lazy var selectCountry: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    private lazy var countryFlagImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "flag")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var numberCode: UILabel = {
        let label = UILabel()
        label.text = "+998"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    private lazy var chevronImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.down")
        iv.tintColor = .gray
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var tfView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    private lazy var numberTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        return tf
    }()
    
    private lazy var saveButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Saqlash", for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        b.clipsToBounds = true
        b.backgroundColor = UIColor(named: "mainColor")
        return b
    }()
    
    private let alert = AlertNumberChange(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Telefon raqamini o'zgartirish"
        initUI()
    }
    
    private func initUI() {
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(saveButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        topStack.addArrangedSubview(yourNumber)
        topStack.addArrangedSubview(fieldsStack)
        
        fieldsStack.addArrangedSubview(selectCountry)
        fieldsStack.addArrangedSubview(tfView)
        
        selectCountry.addSubview(selectCountryStack)
        
        
        selectCountryStack.addArrangedSubview(countryFlagImage)
        selectCountryStack.addArrangedSubview(numberCode)
        selectCountryStack.addArrangedSubview(chevronImage)
        countryFlagImage.translatesAutoresizingMaskIntoConstraints = false
        selectCountryStack.translatesAutoresizingMaskIntoConstraints = false
        let selectCountryStackTapped = UITapGestureRecognizer(target: self, action: #selector(didSelectCountryStackTapped))
        selectCountryStack.addGestureRecognizer(selectCountryStackTapped)
        
        tfView.addSubview(numberTF)
        numberTF.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            selectCountryStack.topAnchor.constraint(equalTo: selectCountry.topAnchor, constant: 10),
            selectCountryStack.leadingAnchor.constraint(equalTo: selectCountry.leadingAnchor, constant: 10),
            selectCountryStack.trailingAnchor.constraint(equalTo: selectCountry.trailingAnchor, constant: -10),
            selectCountryStack.bottomAnchor.constraint(equalTo: selectCountry.bottomAnchor, constant: -10),
            
            countryFlagImage.widthAnchor.constraint(equalToConstant: 40),
            countryFlagImage.heightAnchor.constraint(equalToConstant: 40),
            
            numberTF.centerYAnchor.constraint(equalTo: tfView.centerYAnchor),
            numberTF.leadingAnchor.constraint(equalTo: tfView.leadingAnchor, constant: 10),
            numberTF.trailingAnchor.constraint(equalTo: tfView.trailingAnchor, constant: -10),
            
            saveButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        
        view.addSubview(alert)
        alert.frame = .init(x: 0, y: UIScreen.main.bounds.height,
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height)
    }
    
    @objc private func didSelectCountryStackTapped() {
        print("ok")
        alert.delegate = self
        UIView.animate(withDuration: 0.4) { [self] in
            alert.frame = .init(x: 0, y: 0,
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height)   
        }
    }
}

extension ChangePhoneNumberVC: AlertNumberChangeProtocol {
    func didTappedXButton() {
        UIView.animate(withDuration: 0.4) { [self] in
            alert.frame = .init(x: 0, y: UIScreen.main.bounds.height,
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height)
        }
    }
    
    
}
