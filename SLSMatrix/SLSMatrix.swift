//
//  SLSMatrix.swift
//  ZJB
//
//  Created by slovelys on 2017/5/31.
//  Copyright © 2017年 Neimbo-Education. All rights reserved.
//

import UIKit

class SLSMatrix: UIView {
    
    var itemsWidths: [Float]?
    var numRows: UInt = 0
    var dy: Int = 0
    
    func initinal(frame: CGRect, itemsWidths: [Float]) {
        self.frame = frame
        self.itemsWidths = itemsWidths
    }
    
    func addRecord(record: [String]) {
        if record.count != self.itemsWidths?.count {
            print("!!! Number of record does not match number of items. !!!")
            return
        }
        var rowHeight = 30
        var dx = 0
        
        var items: [Any] = []
        
        for index in 0 ..< record.count {
            let colWidth = self.itemsWidths?[index]
            var rect = CGRect(x: dx, y: dy, width: Int(colWidth!), height: rowHeight)
            
            if index > 0 {
                rect.origin.x -= CGFloat(index)
            }
            
            let col1 = UILabel.init()
            col1.layer.borderColor = UIColor.lightGray.cgColor
            col1.layer.borderWidth = 1
            col1.font = UIFont.init(name: "Helvetica", size: 12.0)
            col1.frame = rect;
            col1.textAlignment = NSTextAlignment.center
            
            if self.numRows == 0 {
                col1.backgroundColor = UIColor.init(white: 0.961, alpha: 1.0)
            }
            
            col1.lineBreakMode = NSLineBreakMode.byCharWrapping;
            col1.numberOfLines = 0;
            col1.text = record[index]
            col1.sizeToFit()
            
            let h = col1.frame.size.height + 10
            if Int(h) > rowHeight {
                rowHeight = Int(h)
            }
            
            rect.size.width = CGFloat(Float(colWidth!))
            col1.frame = rect
            
            items.append(col1)
            
            dx += Int(colWidth!)
        }
        
        for index in 0 ..< items.count {
            let label = items[index] as! UILabel
            var tRect = label.frame
            tRect.size.height = CGFloat(rowHeight)
            label.frame = tRect
            self.addSubview(label)
        }
        
        self.numRows += 1
        self.dy += rowHeight-1
        var tempRect = self.frame
        tempRect.size.height = CGFloat(dy)
        self.frame = tempRect
        
    }
    
}
