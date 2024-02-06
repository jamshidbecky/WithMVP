//
//  NotificationsView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 05/02/24.
//

import UIKit

class NotificationsView: UIView {
    
    private lazy var tableView: UITableView = {
        let tV = UITableView()
        tV.backgroundColor = .clear
        tV.separatorStyle = .none
        tV.showsVerticalScrollIndicator = false
        return tV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
