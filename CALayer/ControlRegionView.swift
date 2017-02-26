//
//  ControlRegionView.swift
//  CALayer
//
//  Created by netNORIMINGCONCEPTION on 2017/02/26.
//  Copyright © 2017年 flatLabel56. All rights reserved.
//

import UIKit
import QuartzCore
/**
 # Floating Buttonとコントローラーを表示するためのview
 - スライドインさせる前のコントローラーをclipsToBoundsで非表示に設定
 - Floating Buttonの座標を移動させるときはこのview単位で行う
 */
class ControlRegionView: UIView {

    var controlview = UIView()
    var floatingBtn = UIButton()
    
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    
    override init(frame: CGRect) {
        //デフォルトのままでは背景がbalckになるためisOpaqueをfalseにする
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.clear.setFill()
        UIRectFill(rect)
        setDefault()
    }
    
    func setDefault(){
        self.layer.cornerRadius = 30.0
        floatingBtn.layer.frame = CGRect.init(x:0, y:0, width:60, height:60)
        floatingBtn.backgroundColor = ConstValue.globalPink
        floatingBtn.layer.cornerRadius = 30.0
        controlview.backgroundColor = ConstValue.globalDeepGreen
        controlview.layer.frame = CGRect.init(x: -310, y: 0, width: 310, height: 60)
        controlview.layer.cornerRadius = 30.0
        controlview.layer.masksToBounds = true
        self.clipsToBounds = true
        
        btn1.layer.frame = CGRect.init(x:80, y:10, width:40, height:40)
        btn1.backgroundColor = ConstValue.globalYellow
        
        btn2.layer.frame = CGRect.init(x:140, y:10, width:40, height:40)
        btn2.backgroundColor = ConstValue.globalYellow
        
        btn3.layer.frame = CGRect.init(x:200, y:10, width:40, height:40)
        btn3.backgroundColor = ConstValue.globalYellow
        
        self.addSubview(controlview)
        controlview.addSubview(btn1)
        controlview.addSubview(btn2)
        controlview.addSubview(btn3)
        self.addSubview(floatingBtn)
        
    }
    
    //controlview非表示時に下のviewへの操作を受け付けたいので、このviewはuserInteractionを受け付けない
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView:UIView? = super.hitTest(point, with: event)
        if(self == hitView)
        {
            return nil
        }
        return hitView
    }
    
    /**
     # アニメーション用メソッド
     - self内をcontrolviewがスライドする
     - ViewControllerから使用すること
    */
    func easeInControlView(){
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {() -> Void
            in
            //self.controlview.layer.opacity = 1
            self.controlview.layer.frame = CGRect.init(x:0, y:0, width:310, height:60)
        }, completion: {(bool:Bool) -> Void in
        })
    }
    
    func easeOutControlView(){
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {() -> Void
            in
            //self.controlview.layer.opacity = 0
            self.controlview.layer.frame = CGRect.init(x:-310, y:0, width:310, height:60)
        }, completion: {(bool:Bool) -> Void in
        })
    }
}

