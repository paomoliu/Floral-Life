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
    /**
     设置label行间距
     
     - parameter lineSpace: 行间距
     - parameter text:      被设置的文本
     
     - returns: 返回属性字符串
     */
    class func setLabelLineSpace(lineSpace: CGFloat, text: String) -> NSAttributedString
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        let attributes = [NSParagraphStyleAttributeName: paragraphStyle]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    /**
     根据文本计算label高度（带行间距）
     
     - parameter lineSpace: 行间距
     - parameter text:      文本
     - parameter font:      字体
     - parameter width:     label宽度
     
     - returns: label高度
     */
    func labelHeightWithLineSpace(lineSpace: CGFloat, text: String, font: UIFont, width: CGFloat) -> CGFloat
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        paragraphStyle.hyphenationFactor = 1.0;
        paragraphStyle.firstLineHeadIndent = 0.0;
        paragraphStyle.paragraphSpacingBefore = 0.0;
        paragraphStyle.headIndent = 0;
        paragraphStyle.tailIndent = 0;
        
        let attributes = [NSFontAttributeName: font , NSParagraphStyleAttributeName: paragraphStyle]
        let size = (text as NSString).boundingRectWithSize(CGSize(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        
        return size.height
    }
    
    /**
     根据文本计算label高度
     
     - parameter text:  文本
     - parameter font:  字体
     - parameter width: label宽度
     */
    func labelHeight(text: String, fontSize: CGFloat, width: CGFloat) -> CGFloat
    {
        self.font = UIFont.systemFontOfSize(fontSize)
        self.text = text
        
        return sizeThatFits(CGSize(width: Double(width), height: Double(MAXFLOAT))).height
    }
}
