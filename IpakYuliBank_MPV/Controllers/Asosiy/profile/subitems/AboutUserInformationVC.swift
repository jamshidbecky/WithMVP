//
//  AboutUserInformationVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 02/03/2024.
//

import UIKit

final class AboutUserInformationVC: UIViewController {
    
    private let login = InfoUser(type: .login)
    private let status = InfoUser(type: .status)
    private let phoneNumber = InfoUser(type: .phoneNumber)
    private let eMail = InfoUser(type: .eMail)
    
    private lazy var mainStack: UIStackView = {
        .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: .zero)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        mainStack.addArrangedSubview(login)
        mainStack.addArrangedSubview(status)
        mainStack.addArrangedSubview(phoneNumber)
        mainStack.addArrangedSubview(eMail)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
