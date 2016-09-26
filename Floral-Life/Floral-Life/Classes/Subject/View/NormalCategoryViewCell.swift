//
//  NormalCategoryViewCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/26.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class NormalCategoryViewCell: BaseCategoryViewCell
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI()
    {
        super.setupUI()
        
        // 布局nameLabel
        contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
    }
    
}
