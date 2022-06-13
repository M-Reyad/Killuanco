//
//  categoryView.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class categoryView: UICollectionViewCell {
    
    
    //Cell Labels//
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Config Func//
    func configForCategory(withCategory category: Category, withTitle yesOrNO : Bool) {
        if yesOrNO{
            self.cellLabel.text = category.categoryName
            self.cellImage.image = category.categoryImage
        } else{
            cellImage.image = category.categoryImage
            self.cellLabel.removeFromSuperview()
        }
        
        
    }
}
