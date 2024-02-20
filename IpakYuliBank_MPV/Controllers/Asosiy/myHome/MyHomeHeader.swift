//
//  MyHomeCVHeader.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

enum MyHomeHeaderMode {
    case cardsAndWallet
    case credits
    case deposits
}
 
protocol MyHomeHeaderDelegate: AnyObject {
    func didSelectButton(mode: MyHomeHeaderMode)
}

final class MyHomeHeader: UICollectionReusableView {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .center, spacing: 20)
    }()
    
    private lazy var firstStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 0)
    }()
    
    private lazy var commonBalanceLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.text = "Umumiy balans"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var secondStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 8)
    }()
    
    private lazy var blncLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .white
        lbl.textAlignment = .justified
        lbl.text = "Balansni ko'rsatish"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var eyeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(nil, for: .normal)
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .clear
        return btn
    }()
    
    private lazy var sliderBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(nil, for: .normal)
        btn.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .clear
        return btn
    }()
    
    private lazy var thridStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fillEqually, align: .fill, spacing: 30)
    }()
    
    let walletAndCards = LabelPlusButton(title: "Kartalar va hamyon", imgName: "banknote")
    
    let credits = LabelPlusButton(title: "Kreditlar", imgName: "door.french.open")

    let deposits = LabelPlusButton(title: "Omonatlar", imgName: "aspectratio")
    
    // MARK: Delegate
    var delegate: MyHomeHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func cardsAndWalletViewPressed() {
        delegate?.didSelectButton(mode: .cardsAndWallet)
    }
    
    @objc private func creditsViewPressed() {
        delegate?.didSelectButton(mode: .credits)
    }
    
    @objc private func depositsViewPressed() {
        delegate?.didSelectButton(mode: .deposits)
    }
    
    private func setupUI() {
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(firstStack)
        mainStack.addArrangedSubview(secondStack)
        mainStack.addArrangedSubview(thridStack)
        
        firstStack.addArrangedSubview(commonBalanceLbl)
        
        secondStack.addArrangedSubview(eyeBtn)
        secondStack.addArrangedSubview(blncLbl)
        secondStack.addArrangedSubview(sliderBtn)
        
        thridStack.addArrangedSubview(walletAndCards)
        thridStack.addArrangedSubview(credits)
        thridStack.addArrangedSubview(deposits)
        
        walletAndCards.isUserInteractionEnabled = true
        
        let gestureWalletAndCards = UITapGestureRecognizer(target: self, action: #selector(cardsAndWalletViewPressed))
        walletAndCards.addGestureRecognizer(gestureWalletAndCards)
        
        let gestureCredits = UITapGestureRecognizer(target: self, action: #selector(creditsViewPressed))
        credits.addGestureRecognizer(gestureCredits)
        
        let gestureDeposits = UITapGestureRecognizer(target: self, action: #selector(depositsViewPressed))
        deposits.addGestureRecognizer(gestureDeposits)
        
        commonBalanceLbl.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        commonBalanceLbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
    }
}
