//
//  SubPanel.swift
//  SubPanelSample
//
//  Created by msnr on 2017/07/16.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class SubPanel : UIView,UIGestureRecognizerDelegate {
    
    var str : NSString = "sample"
    var isDisplay : Bool = true
    let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
    
    @objc func rstClicked(_ sender: Any) {
        KvoModel.sharedInstance.centerUpdate()
    }
    
    func initilize() {
        KvoModel.sharedInstance.addObserver(self, forKeyPath: "point", options: [.new], context: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SubPanel.tapges(_:)))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        
        self.addGestureRecognizer(tap)
        
        let btn = UIButton(frame: CGRect(x: self.frame.width/2 - 30, y: 20, width: 60, height: 20))
        btn.setTitle("change", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(self.rstClicked(_:)), for: .touchUpInside)
        self.addSubview(btn)
        
        self.setNeedsDisplay()
    }

    
    override func draw(_ rect: CGRect) {
        let textFontAttributes = [
            NSAttributedStringKey.font : UIFont(name: "Helvetica Bold", size: 20) as Any,
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.paragraphStyle : textStyle
            ] as [NSAttributedStringKey: Any]
        

        str.draw(in: CGRect(x: 20, y: 100, width: self.frame.width - 10, height: 50)
            , withAttributes: textFontAttributes)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if(keyPath == "point"){
            let p = KvoModel.sharedInstance.point
            str = p.x.description + ":" + p.y.description as NSString
            self.setNeedsDisplay()
        }
    }
    
    @objc func tapges(_ sender: UITapGestureRecognizer) {
        
        isDisplay = !isDisplay
        let sign : CGFloat = isDisplay ? 1 : -1
        
        UIView.animate(withDuration: 1, animations: {
            self.center = CGPoint(x: self.center.x + (sign * (self.frame.width - 10)), y: self.center.y)
        }, completion: nil)
    }
  
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if(gestureRecognizer.view == touch.view){
            return true
        } else {
            return false
        }
    }
    
}
