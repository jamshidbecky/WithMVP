//
//  ChangePasswordVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 03/03/2024.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    private var newPassEyeButtonIsHidden = true
    private var oldPassEyeButtonIsHidden = true
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fillEqually, align: .fill, spacing: 20)
    }()
    
    private lazy var usernameStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var usernameTitle: UILabel = {
        let label = UILabel()
        label.text = "Sizning foydalanuvchi nomingiz"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var usernameTF: UITextField = {
        let tf  = UITextField()
        tf.borderStyle = .none
        tf.placeholder = "Foydalanuvchi nomini kiriting"
        return tf
    }()
    
    private lazy var usernameView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    
    //MARK: -> YourNumberView
    let yourNumberView = YourNumberView()
    
    //MARK: -> Password
    
    private lazy var oldPassStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var oldPassTitle: UILabel = {
        let label = UILabel()
        label.text = "Parol"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var oldPassEyeButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(nil, for: .normal)
        b.setImage(UIImage(systemName: "eye"), for: .normal)
        b.tintColor = UIColor(named: "mainColor")
        return b
    }()
    
    private lazy var oldPassTF: UITextField = {
        let tf  = UITextField()
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        tf.placeholder = "Yangi parol kiriting"
        return tf
    }()
    
    private lazy var oldPassView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    
    
    //MARK: -> New Password

    private lazy var newPassStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var newPassTitle: UILabel = {
        let label = UILabel()
        label.text = "Yangi parolni qayta kiriting"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var newPassEyeButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(nil, for: .normal)
        b.setImage(UIImage(systemName: "eye"), for: .normal)
        b.tintColor = UIColor(named: "mainColor")
        b.backgroundColor = .clear
        return b
    }()
    
    private lazy var newPassTF: UITextField = {
        let tf  = UITextField()
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        tf.placeholder = "Yangi parol kiriting"
        return tf
    }()
    
    private lazy var newPassView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Parolni unutdingizmi?"
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        mainStack.addArrangedSubview(usernameStack)
        usernameStack.addArrangedSubview(usernameTitle)
        usernameStack.addArrangedSubview(usernameView)
        usernameView.addSubview(usernameTF)
        usernameView.setContentHuggingPriority(.defaultLow, for: .vertical)
        usernameView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.centerYAnchor.constraint(equalTo: usernameView.centerYAnchor).isActive = true
//        usernameTF.topAnchor.constraint(equalTo: usernameView.topAnchor, constant: 18).isActive = true
//        usernameTF.bottomAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: -18).isActive = true
        usernameTF.leadingAnchor.constraint(equalTo: usernameView.leadingAnchor, constant: 12).isActive = true
        usernameTF.trailingAnchor.constraint(equalTo: usernameView.trailingAnchor, constant: -12).isActive =
        true
        
        mainStack.addArrangedSubview(yourNumberView)
        
        mainStack.addArrangedSubview(oldPassStack)
        oldPassStack.addArrangedSubview(oldPassTitle)
        oldPassStack.addArrangedSubview(oldPassView)
        oldPassView.addSubview(oldPassTF)
        oldPassView.setContentHuggingPriority(.defaultLow, for: .vertical)
        oldPassView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        oldPassTF.translatesAutoresizingMaskIntoConstraints = false
        oldPassTF.centerYAnchor.constraint(equalTo: oldPassView.centerYAnchor).isActive = true
//        usernameTF.topAnchor.constraint(equalTo: usernameView.topAnchor, constant: 18).isActive = true
//        usernameTF.bottomAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: -18).isActive = true
        oldPassTF.leadingAnchor.constraint(equalTo: oldPassView.leadingAnchor, constant: 12).isActive = true
        oldPassTF.trailingAnchor.constraint(equalTo: oldPassView.trailingAnchor, constant: -12).isActive =
        true
        oldPassTF.rightView = oldPassEyeButton
        oldPassTF.rightViewMode = .always
        
        
        
        mainStack.addArrangedSubview(newPassStack)
        newPassStack.addArrangedSubview(newPassTitle)
        newPassStack.addArrangedSubview(newPassView)
        newPassView.addSubview(newPassTF)
        newPassView.setContentHuggingPriority(.defaultLow, for: .vertical)
        newPassView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        newPassTF.translatesAutoresizingMaskIntoConstraints = false
        newPassTF.centerYAnchor.constraint(equalTo: newPassView.centerYAnchor).isActive = true
//        usernameTF.topAnchor.constraint(equalTo: usernameView.topAnchor, constant: 18).isActive = true
//        usernameTF.bottomAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: -18).isActive = true
        newPassTF.leadingAnchor.constraint(equalTo: newPassView.leadingAnchor, constant: 12).isActive = true
        newPassTF.trailingAnchor.constraint(equalTo: newPassView.trailingAnchor, constant: -12).isActive =
        true
        newPassTF.rightView = newPassEyeButton
        newPassTF.rightViewMode = .always
        
        oldPassEyeButton.addTarget(self, action: #selector(oldPassEyeButtonPressed), for: .touchUpInside)
        newPassEyeButton.addTarget(self, action: #selector(newPassEyeButtonPressed), for: .touchUpInside)
        
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
     
    @objc private func newPassEyeButtonPressed() {
        print("ok")
        newPassEyeButtonIsHidden.toggle()
        
        if newPassEyeButtonIsHidden {
            newPassEyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            newPassTF.isSecureTextEntry = false
        } else {
            newPassEyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            newPassTF.isSecureTextEntry = true
        }
    }
    
    @objc private func oldPassEyeButtonPressed() {
        print("ok")
        oldPassEyeButtonIsHidden.toggle()
        
        if oldPassEyeButtonIsHidden {
            oldPassEyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            oldPassTF.isSecureTextEntry = false
        } else {
            oldPassEyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            oldPassTF.isSecureTextEntry = true
        }
    }
    
    @objc private func saveButtonPressed() {
        if let oldPassText = oldPassTF.text {
            if let newPassText = newPassTF.text {
                if oldPassText == newPassText {
                    Database.shared.saveString(Keys.password, newPassText)
                    print("save in UserDefaults")
                    
                    newPassTF.text = ""
                    oldPassTF.text = ""
                } else {
                    print("error")
                }
            }
        }
    }

    
}


final class YourNumberView: UIView {
    
    private lazy var youNumberMainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var yourNumberStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 12)
    }()
    
    private lazy var flagStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 8)
    }()
    
    private lazy var yourNumberTitle: UILabel = {
        let label = UILabel()
        label.text = "Sizning telefon raqamingiz"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var flagImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "flag")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var yourNmmberCode: UILabel = {
        let label = UILabel()
        label.text = "+998"
        label.font = .systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    private lazy var flagView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    private lazy var yourNumberTF: UITextField = {
        let tf  = UITextField()
        tf.borderStyle = .none
        return tf
    }()
    
    private lazy var yourNumberView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.7
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(youNumberMainStack)
        youNumberMainStack.translatesAutoresizingMaskIntoConstraints = false
        youNumberMainStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        youNumberMainStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        youNumberMainStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        youNumberMainStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        youNumberMainStack.addArrangedSubview(yourNumberTitle)
        youNumberMainStack.addArrangedSubview(yourNumberStack)
        
        yourNumberStack.addArrangedSubview(flagView)
        yourNumberStack.addArrangedSubview(yourNumberView)
        
        flagView.addSubview(flagStack)
        flagStack.translatesAutoresizingMaskIntoConstraints = false
        flagStack.topAnchor.constraint(equalTo: flagView.topAnchor, constant: 12).isActive = true
        flagStack.leadingAnchor.constraint(equalTo: flagView.leadingAnchor, constant: 12).isActive = true
        flagStack.trailingAnchor.constraint(equalTo: flagView.trailingAnchor, constant: -12).isActive = true
        flagStack.bottomAnchor.constraint(equalTo: flagView.bottomAnchor, constant: -12).isActive = true
        
        flagStack.addArrangedSubview(flagImage)
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        flagImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
        flagImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        flagStack.addArrangedSubview(yourNmmberCode)
        
        yourNumberView.addSubview(yourNumberTF)
        yourNumberTF.translatesAutoresizingMaskIntoConstraints = false
        yourNumberTF.centerYAnchor.constraint(equalTo: yourNumberView.centerYAnchor).isActive = true
        yourNumberTF.leadingAnchor.constraint(equalTo: yourNumberView.leadingAnchor, constant: 12).isActive = true
        yourNumberTF.trailingAnchor.constraint(equalTo: yourNumberView.trailingAnchor, constant: -12).isActive = true
    }
}
