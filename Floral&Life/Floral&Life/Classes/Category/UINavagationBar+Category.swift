//
//  UINavagationBar+Category.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

extension UINavigationBar
{
    /**
     隐藏导航栏底部黑线
     */
    func hideBlackLine()
    {
        let blackLineImageView = findHairlineImageViewUnder(self)
        blackLineImageView!.hidden = true
    }
    
    /**
     查找导航栏底部黑线视图
     
     - parameter view: 导航栏
     
     - returns: 需隐藏的底部黑线视图
     */
    private func findHairlineImageViewUnder(view: UIView) -> UIImageView?
    {
        if view.isKindOfClass(UIImageView) && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        
        for subView in view.subviews {
            let imageView = findHairlineImageViewUnder(subView)
            
            if let imgView = imageView {
                return imgView
            }
        }
        
        return nil
    }
}
