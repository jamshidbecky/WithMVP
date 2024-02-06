//
//  UsefulCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

final class UsefulCvCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "w9")
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell(){
        contentView.addSubview(mainView)
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 5
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        
        mainView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0).isActive = true
    }
    
    func prepare(dm: UsefulDM){
        image.image = UIImage(named: dm.imageName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
