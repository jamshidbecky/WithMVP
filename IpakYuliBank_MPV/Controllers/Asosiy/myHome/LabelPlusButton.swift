//
//  LabelPlusButton.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit


final class LabelPlusButton: UIView {
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .white
        img.contentMode = .center
        img.tintColor = UIColor(named: "mainColor")
        return img
    }()

    private lazy var lbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        return lbl
    }()
        
    init(title: String, imgName: String) {
        super.init(frame: .zero)
        lbl.text = title
        image.image = UIImage(systemName: imgName)
        
        
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        mainStack.addArrangedSubview(image)
        mainStack.addArrangedSubview(lbl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1).isActive = true
        image.layer.cornerRadius = image.frame.height / 2
    }
}
