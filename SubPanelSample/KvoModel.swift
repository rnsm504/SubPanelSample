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
    
    func update(point : CGPoint) {
        self.point = point
    }
}
