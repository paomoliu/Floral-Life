//
//  TitleButton.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class TitleButton: UIButton
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setTitle("专题", forState: UIControlState.Normal)
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down_11x6_"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_up_11x6_"), forState: UIControlState.Selected)
        titleLabel?.font = UIFont.systemFontOfSize(15)
        sizeToFit()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width + 5
    }
}
