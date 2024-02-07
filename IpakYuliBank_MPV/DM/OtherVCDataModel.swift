//
//  OtherVCDataModel.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 07/02/24.
//

struct OtherVCDataModel {
    let top: [TopDM]
    let info: [InfoDM]
    let setting: [SettingDM]
}

struct TopDM {
    let imgName: String
    let title: String
    
    init(imgName: String, title: String) {
        self.imgName = imgName
        self.title = title
    }
}

struct InfoDM {
    let imgName: String
    let title: String
    
    init(imgName: String, title: String) {
        self.imgName = imgName
        self.title = title
    }
}

struct SettingDM {
    let imgName: String
    let title: String
    
    init(imgName: String, title: String) {
        self.imgName = imgName
        self.title = title
    }
}
