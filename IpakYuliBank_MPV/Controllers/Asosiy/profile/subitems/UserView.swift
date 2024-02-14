//
//  UserView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit

final class UserView: UIView {
    
    public var username: String = "" {
        didSet {
            usernameLbl.text = username
        }
    }
    
    public var dscrptn: String = "" {
        didSet {
            identificationLbl.text = dscrptn
        }
    }
    
    public var imgName: String = "" {
        didSet {
            viewImage.image = UIImage(systemName: imgName)
        }
    }
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var textStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 5)
    }()
    
    private lazy var usernameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 21)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "KHONDAMIR"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var identificationLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .red
        lbl.textAlignment = .left
        lbl.text = "Sizning statusingiz - identifikatsiyalanmagan foydalanuvchi"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var viewImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "multiply.circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = .red
        img.backgroundColor = .clear
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        mainStack.addArrangedSubview(viewImage)
        mainStack.addArrangedSubview(textStack)
        
        viewImage.translatesAutoresizingMaskIntoConstraints = false

        textStack.addArrangedSubview(usernameLbl)
        textStack.addArrangedSubview(identificationLbl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewImage.heightAnchor.constraint(lessThanOrEqualToConstant: 64).isActive = true
        viewImage.widthAnchor.constraint(equalTo: viewImage.heightAnchor, multiplier: 1).isActive = true
    }
    
}
