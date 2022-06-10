//
//  FavoritesCollectionViewCell.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/30/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    
    //Cell Labels//
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    func config(withLabel name: String, withImage image: UIImage){
        self.cellLabel.text = name
        self.cellImage.image = image
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Config Func//
    func config(withCategory category: Category) {
        self.cellLabel.text = category.categoryName
        self.cellImage.image = category.categoryImage
    }

}
