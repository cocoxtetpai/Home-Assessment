//
//  HTMLItem.swift
//  Home-Assessment
//
//  Created by Coco Xtet Pai on 20/10/2019.
//  Copyright © 2019 Ko Ko Htet Paing. All rights reserved.
//

import Foundation
import UIKit

struct HTMLItem {
    var title: String?
    var titleColor: UIColor?
    var backgroundColor: UIColor?
    
    static func getDummy() -> [HTMLItem] {
        
        let item1 = HTMLItem(title: "title", titleColor: .brown, backgroundColor: .cyan)
        let item2 = HTMLItem(title: "title", titleColor: .brown, backgroundColor: .blue)
        let item3 = HTMLItem(title: "title", titleColor: .brown, backgroundColor: .magenta)

        return [item1, item2, item3]
    }
}
