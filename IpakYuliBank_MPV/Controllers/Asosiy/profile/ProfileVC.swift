//
//  ProfileVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit



final class ProfileVC: UIViewController {
    

    private lazy var scrollView: UIScrollView = {
        let sV = UIScrollView()
        sV.backgroundColor = .clear
        sV.showsVerticalScrollIndicator = false
        return sV
    }()
        
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 16)
    }()
    
    private lazy var user: UserView = {
        let u = UserView()
        u.username = "KHONDAMIR"
        u.dscrptn = "Sizning statusingiz - identifikatsiyalanmagan foydalanuvchi"
        u.imgName = "multiply.circle"
        return u
    }()
    
    private lazy var identifierView: IdentificationView = {
        let v = IdentificationView()
        return v
    }()
    
    let userInfo: SameCellButView = .init(imgName: "info.circle", title: "Foydalanuvchi haqida ma'lumot")
    let changeNumber: SameCellButView = .init(imgName: "iphone.gen1.circle", title: "Telefon raqamini o'zgartirish")
    let changeEmail: SameCellButView = .init(imgName: "ellipsis.message", title: "E-mailni o'zgatirish")
    let changePass: SameCellButView = .init(imgName: "lock", title: "Parolni o'zgartirish")
    let devices: SameCellButView = .init(imgName: "hearingdevice.and.signal.meter", title: "Qurilmalar")
    
    let quitAlert = QuitAlert(frame: .init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        seUpNavigation()
        setUpUI()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabBarController?.tabBar.isHidden = true
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            tabBarController?.tabBar.isHidden = false
        }
    
    private func seUpNavigation() {
        title = "Profil"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(leftBtnTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"), style: .done, target: self, action: #selector(logOutBtnTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func setUpUI() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        scrollView.addSubview(mainStack)
        
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = .init(top: 10, left: 15, bottom: 0, right: 15)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        mainStack.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        mainStack.addArrangedSubview(user)
        mainStack.addArrangedSubview(identifierView)
        mainStack.addArrangedSubview(userInfo)
        mainStack.addArrangedSubview(changeNumber)
        mainStack.addArrangedSubview(changeEmail)
        mainStack.addArrangedSubview(changePass)
        mainStack.addArrangedSubview(devices)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        identifierView.addGestureRecognizer(tap)
        identifierView.isUserInteractionEnabled = true
        
        view.addSubview(quitAlert)

    }
    
    @objc private func leftBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func logOutBtnTapped() {
        
        quitAlert.delegate = self
        
        UIView.animate(withDuration: 0.4) { [self] in
            quitAlert.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
    
    @objc func handleTap() {
         print("view tapped")
      }
}

extension ProfileVC: QuitAlertProtocol {
    func didNoButtonTapped() {
        UIView.animate(withDuration: 0.4) { [self] in
            quitAlert.frame = .init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}
