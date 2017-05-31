//
//  ViewController.swift
//  SLSMatrixDemo
//
//  Created by slovelys on 17/5/31.
//  Copyright © 2017年 slovelys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = SLSMatrix()
        view.initinal(frame: CGRect(x: 16, y: 30, width: self.view.frame.width - 32, height: 100), itemsWidths: [Float(Int(self.view.frame.width - 32) / 2), Float(Int(self.view.frame.width - 32) / 2)])
        view.addRecord(record: ["商品", "价格"])
        view.addRecord(record: ["汽车", "1000"])
        self.view.addSubview(view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

