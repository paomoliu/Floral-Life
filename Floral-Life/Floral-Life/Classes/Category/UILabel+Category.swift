//
//  UILabel+Category.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/25.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

extension UILabel
{
    class func setLabelLineSpace(lineSpace: CGFloat, text: String) -> NSAttributedString
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        let attributes = [NSParagraphStyleAttributeName: paragraphStyle]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
