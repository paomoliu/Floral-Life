//
//  UIButton+Category.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/27.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

extension UIButton
{
    class func createTitleBtn(title: String) -> UIButton
    {
        let btn = UIButton()
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        return btn
    }
}
