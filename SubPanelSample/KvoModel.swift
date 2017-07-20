//
//  KvoClass.swift
//  SubPanelSample
//
//  Created by msnr on 2017/07/17.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class KvoModel : NSObject {
    
    class var sharedInstance: KvoModel {
        struct Singleton {
            static let instance: KvoModel = KvoModel()
        }
        return Singleton.instance
    }
    
    @objc dynamic var point : CGPoint = CGPoint(x: 0, y: 0)
    @objc dynamic var text : String = ""
    
    private var chgFlg = false
    
    func update(point : CGPoint) {
        self.point = point
    }
    
    func centerUpdate() {
        chgFlg = !chgFlg
        self.text = chgFlg ?  "1234567890" : "abcdefghijklmnopqrstuvwxyz"
    }
}
