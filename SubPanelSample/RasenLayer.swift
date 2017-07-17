//
//  Rasen.swift
//  SubPanelSample
//
//  Created by msnr on 2017/07/17.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class RasenLayer : CAShapeLayer {
    
    let w : Int = 30
    let h : Int = 30
    
    override func draw(in ctx: CGContext){
        
        ctx.saveGState()
        
        let l = Int(self.frame.height)/w
        
        for i in 0 ..< l {
            ctx.move(to: CGPoint(x: 0, y: CGFloat((i+1)*w)))
            ctx.addLine(to: CGPoint(x: self.frame.width, y: CGFloat((i+1)*w)))
            ctx.setStrokeColor(UIColor.blue.cgColor)
            ctx.setLineDash(phase: 0, lengths: [1,1])
            ctx.drawPath(using: CGPathDrawingMode.fillStroke)
        }
        
        let r = Int(self.frame.width)/h
        
        for i in 0 ..< r {
            ctx.move(to: CGPoint(x: CGFloat((i+1)*h), y: 0))
            ctx.addLine(to: CGPoint(x: CGFloat((i+1)*h), y: self.frame.height))
            ctx.setStrokeColor(UIColor.blue.cgColor)
            ctx.setLineDash(phase: 0, lengths: [1,1])
            ctx.drawPath(using: CGPathDrawingMode.fillStroke)
        }
        
    }
    
}
