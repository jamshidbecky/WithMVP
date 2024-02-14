//
//  PhoneNumberCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

final class PhoneNumberCvCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 8)
    }()
    
    private lazy var btnsStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 8)
    }()
    
    private lazy var startNumberLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "+998"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var numberTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.borderStyle = .none
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 13)
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.addTarget(self, action: #selector(didChangeNumberTF), for: .editingChanged)
        return tf
    }()
    
    private lazy var myNumberBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("  Mening raqamim  ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray.withAlphaComponent(0.4)
        btn.layer.cornerRadius = 4
        btn.titleLabel?.font = .boldSystemFont(ofSize: 13)
        return btn
    }()
    
    private lazy var contactBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = UIColor(named: "mainColor")
        btn.setImage(UIImage(systemName: "nairasign"), for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
        numberTF.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didChangeNumberTF(){
//        format(with: numberTF.text ?? "", phone: "+998 94 644 99 29")
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    private func initCell(){
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        mainView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 8
        
        mainView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(
            equalTo: mainView.topAnchor, constant: 3).isActive = true
        mainStack.bottomAnchor.constraint(
            equalTo: mainView.bottomAnchor, constant: -3).isActive = true
        mainStack.leadingAnchor.constraint(
            equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(
            equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(startNumberLbl)
        startNumberLbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        startNumberLbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        mainStack.addArrangedSubview(numberTF)
        numberTF.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        numberTF.translatesAutoresizingMaskIntoConstraints = false
        
        mainStack.addArrangedSubview(btnsStack)
        
        btnsStack.addArrangedSubview(myNumberBtn)
        btnsStack.addArrangedSubview(contactBtn)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}


extension PhoneNumberCvCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, 
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "(XX) XXX-XX-XX", phone: newString)
        return false
    }
}
