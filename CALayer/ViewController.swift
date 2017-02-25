//
//  ViewController.swift
//  CALayer
//
//  Created by netNORIMINGCONCEPTION on 2017/02/25.
//  Copyright © 2017年 flatLabel56. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var image = UIImage()
    var imageLayer = CALayer()
    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image = UIImage.init(named: "type.png")!
        btn.layer.contents = self.image.cgImage
        btn.layer.frame = CGRect.init(x: 0, y: 0, width: 200, height: 160)
        btn.layer.position = CGPoint.init(x: 0, y: 0)
        self.view.addSubview(btn)
        self.view.layer.addSublayer(btn.layer)
        //moveLayer(imageLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveLayer(_ layer:CALayer) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(5.0)
        layer.position = CGPoint.init(x: layer.position.x + 100, y: layer.position.y + 200)
        //layer.opacity = 0
        CATransaction.commit()
    }

    @IBAction func moveBtnTouchUpInside(_ sender: Any) {
        moveLayer(btn.layer)
    }

}

