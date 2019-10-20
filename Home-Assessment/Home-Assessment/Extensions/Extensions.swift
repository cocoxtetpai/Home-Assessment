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
