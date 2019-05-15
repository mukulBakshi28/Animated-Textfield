//
//  ViewController.swift
//  TextfieldBottomFillAnimation
//
//  Created by Mukul Bakshi on 15/05/19.
//  Copyright © 2019 Mukul Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTxtField:MBAnimatedTextfield = {
        let txtFld = MBAnimatedTextfield(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        txtFld.borderStyle = .bezel
        txtFld.placeholder = "Enter the Name"
        return txtFld
    }()
    
    //MARK: LifeCycleMethod
    override func viewDidLoad() {
        super.viewDidLoad()
        myTxtField.center = view.center
        myTxtField.animationPos = .Center
        myTxtField.lineColor = .green
        myTxtField.mbDelegate = self
        view.addSubview(myTxtField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension ViewController:MBTextfielDelegates {
}

