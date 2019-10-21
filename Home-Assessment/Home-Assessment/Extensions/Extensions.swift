//
//  Extensions.swift
//  Home-Assessment
//
//  Created by Coco Xtet Pai on 20/10/2019.
//  Copyright © 2019 Ko Ko Htet Paing. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format: "#%06x", rgb)
    }
}

extension String {
    
    func getHTMLStringWithRandomTextAndColor(frame: CGRect, color: UIColor) -> String {
        
//        let color = UIColor.random()
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let html = """
        <html>
        <head>
        
        <style>
        #p1 {background-color:\(color.toHexString());opacity:0.6;}

        .center {
        height: \(frame.height * 2)px;
          position: relative;
        }

        .center p {
          margin: 0;
          position: absolute;
          top: 50%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        </style>
        </head>
        <body>
        
        <body style="background-color:\(color.toHexString());">

        <div class="center">
        <p><font size="20" color=\(UIColor.random().toHexString())>\(letters.randomElement() ?? "?")</font></p>
        
        </div>

        </body>
        </html>
        """
        
        return html
    }
}
