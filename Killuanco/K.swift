//
//  K.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/15/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import Foundation
import UIKit


struct K {
    let notificationCellIdentifier = "NotificationCellIdentifier"
    let notificationTableCellIdentifier = "NotificationTableCellIdentifier"
}

class RoundedCornerRadiusView : UIView{
    override func awakeFromNib() {
        layer.cornerRadius = 20
//        clipsToBounds = false
        
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 17
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
        layer.shouldRasterize = true
        layer.shadowOpacity = 0.15
        
    
}

}
class RoundedCornerRadiusImage: UIImageView {
    override func awakeFromNib() {
        layer.cornerRadius = 50
        clipsToBounds = true
    }
}
