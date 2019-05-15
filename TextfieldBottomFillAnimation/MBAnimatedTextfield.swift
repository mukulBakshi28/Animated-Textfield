//
//  MBAnimatedTextfield.swift
//  TextfieldBottomFillAnimation
//
//  Created by Mukul Bakshi on 15/05/19.
//  Copyright © 2019 Mukul Bakshi. All rights reserved.
//

import Foundation
import UIKit

class MBAnimatedTextfield:UITextField,UITextFieldDelegate {
    
    enum AnimationPosition {
        case Start
        case Center
    }
    
    weak var mbDelegate:MBTextfielDelegates?
    var animationPos:AnimationPosition = .Start
    var lineColor:UIColor = .black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        mbDelegate?.mbTextFieldDidBeginEditing(txtField: textField)
        addAnimatingLayer()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mbDelegate?.mbTextFieldDidEndEditing(txtField: textField)
        removeAnimatingLayer()
    }
}

//Animating Layer
extension MBAnimatedTextfield {
    
    func addAnimatingLayer() {
        let lineLayer = CALayer()
        let pointVal = animationPos == .Start ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0.5)
        lineLayer.anchorPoint = pointVal
        lineLayer.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 2)
        lineLayer.backgroundColor = lineColor.cgColor
        layer.addSublayer(lineLayer)
        let bAnimation = CABasicAnimation()
        bAnimation.keyPath = "bounds"
        bAnimation.fromValue = NSValue(cgRect: CGRect(x: 0, y: frame.size.height - 1, width: 0, height: 2))
        bAnimation.toValue = NSValue(cgRect: CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 2))
        bAnimation.duration = 0.2
        lineLayer.add(bAnimation, forKey: "layerAnimation")
    
    }
    func removeAnimatingLayer() {
        for subLayers in layer.sublayers!  {
            subLayers.removeFromSuperlayer()
        }
    }
}

protocol MBTextfielDelegates: class {
    func mbTextFieldDidBeginEditing(txtField:UITextField)
    func mbTextFieldDidEndEditing(txtField:UITextField)
}

extension MBTextfielDelegates {
    func mbTextFieldDidBeginEditing(txtField:UITextField) {}
    func mbTextFieldDidEndEditing(txtField:UITextField) {}
}

