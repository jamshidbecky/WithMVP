//
//  CardAndWalletsVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 12/02/24.
//

import UIKit
import SnapKit

final class CardAndWalletsVC: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.showsHorizontalScrollIndicator = false
            return scrollView
        }()
    
    private var squareBoolValue = true
    private var imageSquare = UIImage(systemName: "square.split.1x2")
    
    let segmentedControl = CustomSegmentedControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentedControl.items = ["Barchasi", "So'mda", "Xalqaor", "Hamyon va boshqalar"]
        segmentedControl.delegate = self
        
        

        
    }
    
    private func initUI() {
        view.backgroundColor = .white
        title = "Kartalar va hamyonlar"
        
        var plusBtn = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .done, target: self,
            action: #selector(plusButtonTapped)
        )
        
        var squareBtn = UIBarButtonItem(
            image: imageSquare,
            style: .done, target: self,
            action: #selector(squareButtonTapped)
        )
        plusBtn.tintColor = UIColor(named: "mainColor")
        squareBtn.tintColor = .black
        navigationItem.rightBarButtonItems = [plusBtn, squareBtn]
        
       
    }
    
    @objc private func plusButtonTapped() {
        print("ok1")
    }
    
    @objc private func squareButtonTapped() {
        squareBoolValue.toggle()
        if squareBoolValue {
            imageSquare = UIImage(systemName: "square.split.2x2")
        } else {
            imageSquare = UIImage(systemName: "square.split.1x2")
        }
        print("ok", squareBoolValue)
    }
}


extension CardAndWalletsVC: CustomSegmentedControlDelegate {
    func didSelectItemAt(index: Int) {
        // Handle the selection of the segmented control item
        print("Selected index: \(index)")
    }
}
