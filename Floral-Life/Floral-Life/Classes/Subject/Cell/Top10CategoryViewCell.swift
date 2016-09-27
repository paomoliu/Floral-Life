//
//  Top10CategoryViewCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/26.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class Top10CategoryViewCell: BaseCategoryViewCell
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
        
        // 重设nameLabel字体大小
        nameLabel.font = UIFont.systemFontOfSize(14)
        
        // 布局nameLabel
        contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 20))
        contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 30))
    }
}
