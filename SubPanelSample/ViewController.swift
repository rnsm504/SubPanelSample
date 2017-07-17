//
//  ViewController.swift
//  SubPanelSample
//
//  Created by msnr on 2017/07/16.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var subPanel: SubPanel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        subPanel.backgroundColor = UIColor(hue: 0.390, saturation: 1.0, brightness: 1.0, alpha: 0.5)
        subPanel.initilize()
        
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: 1000, height: 1000)
        scrollView.backgroundColor = UIColor.white
        
        let rasenLayer = RasenLayer()
        rasenLayer.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        rasenLayer.setNeedsDisplay()
        scrollView.layer.addSublayer(rasenLayer)
        
        let lbl = UILabel(frame: CGRect(x: 20, y: 100, width: 500, height: 100))
        lbl.text = "abcdefghijklmnopqrstuvwxyz"
        lbl.textColor = UIColor.gray
        
        scrollView.addSubview(lbl)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapges(_:)))
        
        scrollView.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func tapges(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: scrollView)
        
        KvoModel.sharedInstance.update(point: point)
    }
}

