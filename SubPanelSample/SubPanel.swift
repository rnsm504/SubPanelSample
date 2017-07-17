//
//  SubPanel.swift
//  SubPanelSample
//
//  Created by msnr on 2017/07/16.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class SubPanel : UIView {
    
    var str : NSString = "sample"
    let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
    
    func initilize() {
        KvoModel.sharedInstance.addObserver(self, forKeyPath: "point", options: [.new], context: nil)
    }

    
    override func draw(_ rect: CGRect) {
        let textFontAttributes = [
            NSAttributedStringKey.font : UIFont(name: "Helvetica Bold", size: 20) as Any,
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.paragraphStyle : textStyle
            ] as [NSAttributedStringKey: Any]
        

        str.draw(in: CGRect(x: 20, y: 20, width: self.frame.width - 10, height: 50)
            , withAttributes: textFontAttributes)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if(keyPath == "point"){
            let p = KvoModel.sharedInstance.point
            str = p.x.description + ":" + p.y.description as NSString
            self.setNeedsDisplay()
        }
    }
 }
