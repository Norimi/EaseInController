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
    var classedControlRegion = ControlRegionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefault()
    }
    
    func setDefault(){
        classedControlRegion.layer.frame = CGRect.init(x:30, y:240, width:310, height:60)
        classedControlRegion.floatingBtn.addTarget(self, action: #selector(commitAnimations), for: .touchUpInside)
        self.view.addSubview(classedControlRegion)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commitAnimations(){
        
        //classedControlRegion.easeInControlView()
        if (classedControlRegion.bounds).contains(classedControlRegion.controlview.frame)
        {
            //view is completely out of bounds of its super view.
            classedControlRegion.easeOutControlView()
        }else {
            classedControlRegion.easeInControlView()

        }

    }
    
}

