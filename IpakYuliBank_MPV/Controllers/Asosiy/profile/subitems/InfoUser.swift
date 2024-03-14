//
//  InfoUser.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 02/03/2024.
//

import UIKit

enum TypeOfInfoUser {
    case login
    case status
    case phoneNumber
    case eMail
}

final class InfoUser: UIView {
    private lazy var mainStack: UIStackView = {
        .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var topStack: UIStackView = {
        .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 4)
    }()
    
    private lazy var bottomBorder: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray.withAlphaComponent(0.4)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return v
    }()
    
    private lazy var viewTitle: UILabel = {
        let label = UILabel()
        label.text = "Ok"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .gray
        label.backgroundColor = .clear
        label.textAlignment = .left
        return label
    }()
    
    private lazy var viewTitleValue: UILabel = {
        let label = UILabel()
        label.text = "Ok"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .left
        return label
    }()
    
    init(type: TypeOfInfoUser) {
        super.init(frame: .zero)

        switch type {
        case .login:
            viewTitle.text = "Login"
            viewTitleValue.text = "KHONDAMIR"
        case .status:
            viewTitle.text = "Status"
            viewTitleValue.text = "FAOL"
        case .phoneNumber:
            viewTitle.text = "Telefon raqami"
            viewTitleValue.text = "+998944007721"
        case .eMail:
            viewTitle.text = "Elektron manzili"
            viewTitleValue.text = ""
        }
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(bottomBorder)
        
        topStack.addArrangedSubview(viewTitle)
        topStack.addArrangedSubview(viewTitleValue)
        
        
        
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}

extension UIStackView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(
            x: 0,
            y: self.frame.size.height - width,
            width: self.frame.size.width,
            height: width
        )
        self.layer.addSublayer(border)
    }
}
